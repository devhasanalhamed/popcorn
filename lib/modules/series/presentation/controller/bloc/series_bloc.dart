import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn/core/utils/enums.dart';
import 'package:popcorn/modules/series/domain/usecase/get_airing_today_series_usecase.dart';
import 'package:popcorn/modules/series/domain/usecase/get_popular_series_usecase.dart';
import 'package:popcorn/modules/series/domain/usecase/get_top_reated_series_usecase.dart';
import 'package:popcorn/modules/series/presentation/controller/bloc/series_event.dart';
import 'package:popcorn/modules/series/presentation/controller/bloc/series_state.dart';

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {
  final GetAiringTodaySeriesUsecase getAiringTodaySeriesUsecase;
  final GetPopularSeriesUsecase getPopularSeriesUsecase;
  final GetTopReatedSeriesUsecase getTopReatedSeriesUsecase;
  SeriesBloc(
    this.getAiringTodaySeriesUsecase,
    this.getPopularSeriesUsecase,
    this.getTopReatedSeriesUsecase,
  ) : super(SeriesState()) {
    on<GetAiringTodaySeriesEvent>(
      (event, emit) async {
        final result = await getAiringTodaySeriesUsecase.execute();
        result.fold(
          (l) => emit(state.copyWith(
            airingTodayState: RequestState.error,
            airingToadyMessage: l.message,
          )),
          (r) => emit(state.copyWith(
            airingTodayState: RequestState.done,
            airingTodaySeries: r,
          )),
        );
      },
    );

    on<GetPopularSeriesEvent>(
      (event, emit) async {
        final result = await getPopularSeriesUsecase.execute();
        result.fold(
          (l) => emit(state.copyWith(
            popularState: RequestState.error,
            popularMessage: l.message,
          )),
          (r) => emit(state.copyWith(
            popularState: RequestState.done,
            popularSeries: r,
          )),
        );
      },
    );

    on<GetTopRatedSeriesEvent>(
      (event, emit) async {
        final result = await getTopReatedSeriesUsecase.execute();
        print(result);
        result.fold(
          (l) => emit(state.copyWith(
            topRatedState: RequestState.error,
            topRatedMessage: l.message,
          )),
          (r) => emit(state.copyWith(
            topRatedState: RequestState.done,
            topRatedSeries: r,
          )),
        );
      },
    );
  }
}
