import 'package:dartz/dartz.dart';
import 'package:popcorn/core/error/failure.dart';
import 'package:popcorn/core/usecase/base_usecase.dart';
import 'package:popcorn/modules/series/domain/entity/series.dart';
import 'package:popcorn/modules/series/domain/repository/base_series_repository.dart';

class GetAiringTodaySeriesUsecase
    extends BaseUsecase<List<Series>, NoParameters> {
  final BaseSeriesRepository baseSeriesRepository;

  GetAiringTodaySeriesUsecase({required this.baseSeriesRepository});

  @override
  Future<Either<Failure, List<Series>>> call(NoParameters noParametrs) async {
    return await baseSeriesRepository.getAiringTodaySeries();
  }
}
