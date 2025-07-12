import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn/core/utils/enums.dart';
import 'package:popcorn/modules/series/domain/usecase/get_series_details_usecase.dart';
import 'package:popcorn/modules/series/domain/usecase/get_series_recommendations_usecase.dart';
import 'package:popcorn/modules/series/presentation/controller/series_details_event.dart';
import 'package:popcorn/modules/series/presentation/controller/series_details_state.dart';

class SeriesDetailsBloc extends Bloc<SeriesDetailsEvent, SeriesDetailsState> {
  final GetSeriesDetailsUsecase getSeriesDetailsUsecase;
  final GetSeriesRecommendationsUsecase getSeriesRecommendationsUsecase;

  SeriesDetailsBloc(
    this.getSeriesDetailsUsecase,
    this.getSeriesRecommendationsUsecase,
  ) : super(const SeriesDetailsState()) {
    on<GetSeriesDetailsEvent>(_getSeriesDetails);
    on<GetSeriesRecommnedationsEvent>(_getSeriesRecommendations);
  }

  FutureOr<void> _getSeriesDetails(
      GetSeriesDetailsEvent event, Emitter<SeriesDetailsState> emit) async {
    final result = await getSeriesDetailsUsecase(
        SeriesDetailsParameters(seriesId: event.seriesId));
    result.fold(
      (l) => emit(state.copyWith(
        seriesDetailsState: RequestState.error,
        seriesDetailsMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        seriesDetailsState: RequestState.done,
        seriesDetails: r,
      )),
    );
  }

  FutureOr<void> _getSeriesRecommendations(GetSeriesRecommnedationsEvent event,
      Emitter<SeriesDetailsState> emit) async {
    final result = await getSeriesRecommendationsUsecase(
        SeriesRecommendationsParameters(id: event.seriesId));

    result.fold(
        (l) => emit(state.copyWith(
              seriesRecommendationsState: RequestState.error,
              seriesRecommendationsMessage: l.message,
            )),
        (r) => emit(
              state.copyWith(
                seriesRecommendationsState: RequestState.done,
                seriesRecommendations: r,
              ),
            ));
  }
}
