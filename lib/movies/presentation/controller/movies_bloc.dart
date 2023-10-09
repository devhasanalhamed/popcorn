import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn/core/utils/enums.dart';
import 'package:popcorn/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:popcorn/movies/presentation/controller/movies_event.dart';
import 'package:popcorn/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();
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
