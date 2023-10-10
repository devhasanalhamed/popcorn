import 'package:equatable/equatable.dart';
import 'package:popcorn/core/utils/enums.dart';
import 'package:popcorn/movies/data/models/movie_model.dart';

class MoviesState extends Equatable {
  final List<MovieModel> nowPlayingMovies;
  final RequestState nowPlayingMoviesState;
  final String nowPlayingMessage;
  final List<MovieModel> popularMovies;
  final RequestState popularMoviesState;
  final String popularMessage;
  final List<MovieModel> topRatedMovies;
  final RequestState topRatedMoviesState;
  final String topRatedMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingMoviesState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.popularMovies = const [],
    this.popularMoviesState = RequestState.loading,
    this.popularMessage = '',
    this.topRatedMovies = const [],
    this.topRatedMoviesState = RequestState.loading,
    this.topRatedMessage = '',
  });

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingMoviesState,
        nowPlayingMessage,
      ];
}
