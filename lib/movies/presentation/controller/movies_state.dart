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

  MoviesState copyWith({
    List<MovieModel>? nowPlayingMovies,
    RequestState? nowPlayingMoviesState,
    String? nowPlayingMessage,
    List<MovieModel>? popularMovies,
    RequestState? popularMoviesState,
    String? popularMessage,
    List<MovieModel>? topRatedMovies,
    RequestState? topRatedMoviesState,
    String? topRatedMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingMoviesState:
          nowPlayingMoviesState ?? this.nowPlayingMoviesState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMoviesState: popularMoviesState ?? this.popularMoviesState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingMoviesState,
        nowPlayingMessage,
        popularMovies,
        popularMoviesState,
        popularMessage,
        topRatedMovies,
        topRatedMoviesState,
        topRatedMessage,
      ];
}
