import 'package:equatable/equatable.dart';
import 'package:popcorn/core/utils/enums.dart';
import 'package:popcorn/movies/data/models/movie_model.dart';

class MoviesState extends Equatable {
  final List<MovieModel> nowPlayingMovies;
  final RequestState nowPlayingMoviesState;
  final String nowPlayingMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingMoviesState = RequestState.loading,
    this.nowPlayingMessage = '',
  });

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingMoviesState,
        nowPlayingMessage,
      ];
}
