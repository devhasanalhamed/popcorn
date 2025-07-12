import 'package:dartz/dartz.dart';
import 'package:popcorn/core/error/failure.dart';
import 'package:popcorn/modules/series/domain/entity/series.dart';
import 'package:popcorn/modules/series/domain/entity/series_details.dart';
import 'package:popcorn/modules/series/domain/entity/series_recommendation.dart';
import 'package:popcorn/modules/series/domain/usecase/get_series_details_usecase.dart';
import 'package:popcorn/modules/series/domain/usecase/get_series_recommendations_usecase.dart';

abstract class BaseSeriesRepository {
  Future<Either<Failure, List<Series>>> getAiringTodaySeries();

  Future<Either<Failure, List<Series>>> getPopularSeries();

  Future<Either<Failure, List<Series>>> getTopRatesSeries();

  Future<Either<Failure, SeriesDetails>> getSeriesDetails(
      SeriesDetailsParameters parameters);

  Future<Either<Failure, List<SeriesRecommendation>>> getSeriesRecommendations(
      SeriesRecommendationsParameters parameters);
}
