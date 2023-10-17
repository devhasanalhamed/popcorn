import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn/core/utils/enums.dart';
import 'package:popcorn/movies/domain/entity/movie_details.dart';
import 'package:popcorn/movies/domain/entity/recommendations.dart';
import 'package:popcorn/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:popcorn/movies/domain/usecase/get_recommendations.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(
    this.getMovieDetailsUseCase,
    this.getRecommendationsUseCase,
  ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationsEvent>(_getRecommendations);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationsUseCase getRecommendationsUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));

    result.fold(
      (l) => emit(state.copyWith(
        movieDetailsState: RequestState.error,
        movieDetailsMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        movieDetails: r,
        movieDetailsState: RequestState.loaded,
      )),
    );
  }

  FutureOr<void> _getRecommendations(GetMovieRecommendationsEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationsUseCase(
        RecommendationsParameters(id: event.id));
    result.fold(
      (l) => emit(state.copyWith(
          recommendationsState: RequestState.error,
          recommendationsMessage: l.message)),
      (r) => emit(state.copyWith(
        recommendations: r,
        recommendationsState: RequestState.loaded,
      )),
    );
  }
}
