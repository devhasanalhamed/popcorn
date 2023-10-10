import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn/core/utils/enums.dart';
import 'package:popcorn/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:popcorn/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:popcorn/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:popcorn/movies/presentation/controller/movies_event.dart';
import 'package:popcorn/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();
      result.fold(
        (l) => emit(MoviesState(
          nowPlayingMoviesState: RequestState.error,
          nowPlayingMessage: l.message,
        )),
        (r) => emit(MoviesState(
          nowPlayingMovies: r,
          nowPlayingMoviesState: RequestState.loaded,
        )),
      );
    });
    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase.execute();
      result.fold(
        (l) => emit(
          MoviesState(
            popularMoviesState: RequestState.error,
            popularMessage: l.message,
          ),
        ),
        (r) => emit(
          MoviesState(
            popularMovies: r,
            popularMoviesState: RequestState.loaded,
          ),
        ),
      );
    });
    on<GetTopRatedMoviesEvent>((event, emit) async {});
  }
}
