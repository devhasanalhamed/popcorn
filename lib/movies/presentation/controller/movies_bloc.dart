import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn/core/utils/enums.dart';
import 'package:popcorn/movies/data/datasource/movie_remote_data_source.dart';
import 'package:popcorn/movies/data/repository/movies_repository.dart';
import 'package:popcorn/movies/domain/repository/base_movies_repository.dart';
import 'package:popcorn/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:popcorn/movies/presentation/controller/movies_event.dart';
import 'package:popcorn/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      BaseMoviesRemoteDataSource baseMoviesRemoteDataSource =
          MoviesRemoteDataSource();
      BaseMoviesRepository baseMoviesRepository = MoviesRepository(
          baseMovieRemoteDataSource: baseMoviesRemoteDataSource);
      final result = await GetNowPlayingMoviesUseCase(
              baseMoviesRepository: baseMoviesRepository)
          .execute();
      emit(const MoviesState(nowPlayingMoviesState: RequestState.loaded));
      result.fold(
        (l) => emit(MoviesState(
          nowPlayingMoviesState: RequestState.error,
          nowPlayingMessage: l.message,
        )),
        (r) => emit(MoviesState(
          nowPlayingMoviesState: RequestState.loaded,
          nowPlayingMovies: r,
        )),
      );
    });
  }
}
