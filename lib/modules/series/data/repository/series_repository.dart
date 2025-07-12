import 'package:dartz/dartz.dart';
import 'package:popcorn/core/error/exceptions.dart';
import 'package:popcorn/core/error/failure.dart';
import 'package:popcorn/modules/series/data/datasource/series_remote_data_source.dart';
import 'package:popcorn/modules/series/domain/entity/series.dart';
import 'package:popcorn/modules/series/domain/entity/series_details.dart';
import 'package:popcorn/modules/series/domain/entity/series_recommendation.dart';
import 'package:popcorn/modules/series/domain/repository/base_series_repository.dart';
import 'package:popcorn/modules/series/domain/usecase/get_series_details_usecase.dart';
import 'package:popcorn/modules/series/domain/usecase/get_series_recommendations_usecase.dart';

class SeriesRepository implements BaseSeriesRepository {
  final BaseSeriesRemoteDataSource baseSeriesRemoteDataSource;

  SeriesRepository({required this.baseSeriesRemoteDataSource});

  @override
  Future<Either<Failure, List<Series>>> getAiringTodaySeries() async {
    final result = await baseSeriesRemoteDataSource.getAiringTodaySeries();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Series>>> getPopularSeries() async {
    final result = await baseSeriesRemoteDataSource.getPopularSeries();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Series>>> getTopRatesSeries() async {
    final result = await baseSeriesRemoteDataSource.getTopRatedSeries();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, SeriesDetails>> getSeriesDetails(
      SeriesDetailsParameters parameters) async {
    final result =
        await baseSeriesRemoteDataSource.getSeriesDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failur) {
      return Left(
          ServerFailure(message: failur.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<SeriesRecommendation>>> getSeriesRecommendations(
      SeriesRecommendationsParameters parameters) async {
    final result =
        await baseSeriesRemoteDataSource.getSeriesRecommendations(parameters);
    try {
      return Right(result);
    } on ServerException catch (failur) {
      return Left(
          ServerFailure(message: failur.errorMessageModel.statusMessage));
    }
  }
}
