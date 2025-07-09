import 'package:dio/dio.dart';
import 'package:popcorn/core/constants/api_constants.dart';
import 'package:popcorn/core/error/exceptions.dart';
import 'package:popcorn/core/network/error_message_model.dart';
import 'package:popcorn/modules/series/data/model/series_model.dart';

abstract class BaseSeriesRemoteDataSource {
  Future<List<SeriesModel>> getAiringTodaySeries();

  Future<List<SeriesModel>> getPopularSeries();

  Future<List<SeriesModel>> getTopRatedSeries();
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
    print(ApiConstants.topRatedSeriesPath);
    if (result.statusCode == 200) {
      return List.from(
          result.data['results'].map((e) => SeriesModel.fromJson(e)));
    }

    throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(result.data));
  }
}
