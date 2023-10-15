import 'package:dartz/dartz.dart';
import 'package:popcorn/core/error/failure.dart';
import 'package:popcorn/movies/data/models/movie_model.dart';
import 'package:popcorn/movies/domain/entity/movie_details.dart';

//! this is called contract
abstract class BaseMoviesRepository {
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies();

  Future<Either<Failure, List<MovieModel>>> getPopularMovies();

  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails();
}
