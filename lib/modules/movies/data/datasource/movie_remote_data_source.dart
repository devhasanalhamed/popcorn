import 'package:dio/dio.dart';
import 'package:popcorn/core/error/exceptions.dart';
import 'package:popcorn/core/constants/api_constants.dart';
import 'package:popcorn/core/network/error_message_model.dart';
import 'package:popcorn/modules/movies/data/model/movie_details_model.dart';
import 'package:popcorn/modules/movies/data/model/movie_model.dart';
import 'package:popcorn/modules/movies/data/model/recommendations_model.dart';
import 'package:popcorn/modules/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:popcorn/modules/movies/domain/usecase/get_recommendations.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies(); //? this is called contract

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);

  Future<List<RecommendationsModel>> getRecommendations(
      RecommendationsParameters parameters);
}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstants.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstants.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstants.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConstants.movieDetailPath(parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationsModel>> getRecommendations(
      RecommendationsParameters parameters) async {
    final response =
        await Dio().get(ApiConstants.recommendationsPath(parameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationsModel>.from(response.data['results']
          .map((x) => RecommendationsModel.fromJson(x)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
