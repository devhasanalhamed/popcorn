// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:popcorn/core/error/failure.dart';

import 'package:popcorn/core/usecase/base_usecase.dart';
import 'package:popcorn/modules/series/domain/entity/series_details.dart';
import 'package:popcorn/modules/series/domain/repository/base_series_repository.dart';

class GetSeriesDetailsUsecase
    extends BaseUsecase<SeriesDetails, SeriesDetailsParameters> {
  final BaseSeriesRepository baseSeriesRepository;

  GetSeriesDetailsUsecase({required this.baseSeriesRepository});

  @override
  Future<Either<Failure, SeriesDetails>> call(
      SeriesDetailsParameters parameters) async {
    return await baseSeriesRepository.getSeriesDetails(parameters);
  }
}

class SeriesDetailsParameters extends Equatable {
  final int seriesId;
  const SeriesDetailsParameters({
    required this.seriesId,
  });

  @override
  List<Object> get props => [seriesId];
}
