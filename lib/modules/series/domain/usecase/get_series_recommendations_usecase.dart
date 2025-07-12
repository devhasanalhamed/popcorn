// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:popcorn/core/error/failure.dart';

import 'package:popcorn/core/usecase/base_usecase.dart';
import 'package:popcorn/modules/series/domain/entity/series_recommendation.dart';
import 'package:popcorn/modules/series/domain/repository/base_series_repository.dart';

class GetSeriesRecommendationsUsecase extends BaseUsecase<
    List<SeriesRecommendation>, SeriesRecommendationsParameters> {
  final BaseSeriesRepository baseSeriesRepository;

  GetSeriesRecommendationsUsecase({required this.baseSeriesRepository});

  @override
  Future<Either<Failure, List<SeriesRecommendation>>> call(
      SeriesRecommendationsParameters parameters) async {
    return await baseSeriesRepository.getSeriesRecommendations(parameters);
  }
}

class SeriesRecommendationsParameters extends Equatable {
  final int id;

  const SeriesRecommendationsParameters({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
