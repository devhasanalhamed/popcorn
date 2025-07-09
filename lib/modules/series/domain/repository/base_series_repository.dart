import 'package:dartz/dartz.dart';
import 'package:popcorn/core/error/failure.dart';
import 'package:popcorn/modules/series/domain/entity/series.dart';

abstract class BaseSeriesRepository {
  Future<Either<Failure, List<Series>>> getAiringTodaySeries();

  Future<Either<Failure, List<Series>>> getPopularSeries();

  Future<Either<Failure, List<Series>>> getTopRatesSeries();
}
