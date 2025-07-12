import 'package:dio/dio.dart';
import 'package:popcorn/core/constants/api_constants.dart';
import 'package:popcorn/core/error/exceptions.dart';
import 'package:popcorn/core/network/error_message_model.dart';
import 'package:popcorn/modules/series/data/model/series_details_model.dart';
import 'package:popcorn/modules/series/data/model/series_model.dart';
import 'package:popcorn/modules/series/data/model/series_recommendation_model.dart';
import 'package:popcorn/modules/series/domain/usecase/get_series_details_usecase.dart';
import 'package:popcorn/modules/series/domain/usecase/get_series_recommendations_usecase.dart';

abstract class BaseSeriesRemoteDataSource {
  Future<List<SeriesModel>> getAiringTodaySeries();

  Future<List<SeriesModel>> getPopularSeries();

  Future<List<SeriesModel>> getTopRatedSeries();

  Future<SeriesDetailsModel> getSeriesDetails(
      SeriesDetailsParameters parameters);

  Future<List<SeriesRecommendationModel>> getSeriesRecommendations(
      SeriesRecommendationsParameters parameters);
}

class SeriesRemoteDataSource implements BaseSeriesRemoteDataSource {
  @override
  Future<List<SeriesModel>> getAiringTodaySeries() async {
    final result = await Dio().get(ApiConstants.airingTodaySeriesPath);
    if (result.statusCode == 200) {
      return List.from(
          result.data['results'].map((e) => SeriesModel.fromJson(e)));
    }

    throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(result.data));
  }

  @override
  Future<List<SeriesModel>> getPopularSeries() async {
    final result = await Dio().get(ApiConstants.popularSeriesPath);
    if (result.statusCode == 200) {
      return List.from(
          result.data['results'].map((e) => SeriesModel.fromJson(e)));
    }

    throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(result.data));
  }

  @override
  Future<List<SeriesModel>> getTopRatedSeries() async {
    final result = await Dio().get(ApiConstants.topRatedSeriesPath);
    if (result.statusCode == 200) {
      return List.from(
          result.data['results'].map((e) => SeriesModel.fromJson(e)));
    }

    throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(result.data));
  }

  @override
  Future<SeriesDetailsModel> getSeriesDetails(
      SeriesDetailsParameters parameters) async {
    final result =
        await Dio().get(ApiConstants.seriesDetailsPath(parameters.seriesId));
    if (result.statusCode == 200) {
      return SeriesDetailsModel.fromJson(result.data);
    }

    throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(result.data));
  }

  @override
  Future<List<SeriesRecommendationModel>> getSeriesRecommendations(
      SeriesRecommendationsParameters parameters) async {
    final result =
        await Dio().get(ApiConstants.seriesRecommendationsPath(parameters.id));

    if (result.statusCode == 200) {
      return List.from(result.data['results']
          .map((e) => SeriesRecommendationModel.fromJson(e)));
    }

    throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(result.data));
  }
}
