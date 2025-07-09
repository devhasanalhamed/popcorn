import 'package:dartz/dartz.dart';
import 'package:popcorn/core/error/exceptions.dart';
import 'package:popcorn/core/error/failure.dart';
import 'package:popcorn/modules/series/data/datasource/series_remote_data_source.dart';
import 'package:popcorn/modules/series/domain/entity/series.dart';
import 'package:popcorn/modules/series/domain/repository/base_series_repository.dart';

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
}
