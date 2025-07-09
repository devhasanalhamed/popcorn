import 'package:dartz/dartz.dart';
import 'package:popcorn/core/error/failure.dart';
import 'package:popcorn/modules/series/domain/entity/series.dart';
import 'package:popcorn/modules/series/domain/repository/base_series_repository.dart';

class GetPopularSeriesUsecase {
  final BaseSeriesRepository baseSeriesRepository;

  GetPopularSeriesUsecase({required this.baseSeriesRepository});

  Future<Either<Failure, List<Series>>> execute() async {
    return await baseSeriesRepository.getPopularSeries();
  }
}
