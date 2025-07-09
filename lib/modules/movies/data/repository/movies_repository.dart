import 'package:dartz/dartz.dart';
import 'package:popcorn/core/error/exceptions.dart';
import 'package:popcorn/core/error/failure.dart';
import 'package:popcorn/modules/movies/data/datasource/movie_remote_data_source.dart';
import 'package:popcorn/modules/movies/data/model/movie_model.dart';
import 'package:popcorn/modules/movies/domain/entity/movie_details.dart';
import 'package:popcorn/modules/movies/domain/entity/recommendations.dart';
import 'package:popcorn/modules/movies/domain/repository/base_movies_repository.dart';
import 'package:popcorn/modules/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:popcorn/modules/movies/domain/usecase/get_recommendations.dart';

class MoviesRepository implements BaseMoviesRepository {
  final BaseMoviesRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository({required this.baseMovieRemoteDataSource});

  @override
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendations>>> getRecommendations(
      RecommendationsParameters parameters) async {
    final result =
        await baseMovieRemoteDataSource.getRecommendations(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }
}
