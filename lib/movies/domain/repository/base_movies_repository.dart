import 'package:popcorn/movies/domain/entity/movide.dart';

//! this is called contract
abstract class BaseMoviesRepository {
  Future<List<Movie>> getNowPlayingMovies();

  Future<List<Movie>> getPopularMovies();

  Future<List<Movie>> getTopRatedMovies();
}
