import 'package:dartz/dartz.dart';
import 'package:popcorn/core/error/failure.dart';
import 'package:popcorn/modules/series/domain/entity/series.dart';
import 'package:popcorn/modules/series/domain/repository/base_series_repository.dart';

class GetAiringTodaySeriesUsecase {
  final BaseSeriesRepository baseSeriesRepository;

  GetAiringTodaySeriesUsecase({required this.baseSeriesRepository});

  Future<Either<Failure, List<Series>>> execute() async {
    return await baseSeriesRepository.getAiringTodaySeries();
  }
}
