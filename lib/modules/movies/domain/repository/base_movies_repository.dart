import 'package:dartz/dartz.dart';
import 'package:popcorn/core/error/failure.dart';
import 'package:popcorn/modules/movies/data/model/movie_model.dart';
import 'package:popcorn/modules/movies/domain/entity/movie_details.dart';
import 'package:popcorn/modules/movies/domain/entity/recommendations.dart';
import 'package:popcorn/modules/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:popcorn/modules/movies/domain/usecase/get_recommendations.dart';

//! this is called contract
abstract class BaseMoviesRepository {
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies();

  Future<Either<Failure, List<MovieModel>>> getPopularMovies();

  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters);

  Future<Either<Failure, List<Recommendations>>> getRecommendations(
      RecommendationsParameters parameters);
}
