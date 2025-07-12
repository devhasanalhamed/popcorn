import 'package:dartz/dartz.dart';
import 'package:popcorn/core/error/failure.dart';
import 'package:popcorn/core/usecase/base_usecase.dart';
import 'package:popcorn/modules/series/domain/entity/series.dart';
import 'package:popcorn/modules/series/domain/repository/base_series_repository.dart';

class GetPopularSeriesUsecase extends BaseUsecase<List<Series>, NoParameters> {
  final BaseSeriesRepository baseSeriesRepository;

  GetPopularSeriesUsecase({required this.baseSeriesRepository});

  @override
  Future<Either<Failure, List<Series>>> call(NoParameters noParameters) async {
    return await baseSeriesRepository.getPopularSeries();
  }
}
