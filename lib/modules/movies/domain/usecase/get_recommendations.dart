import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:popcorn/core/error/failure.dart';
import 'package:popcorn/core/usecase/base_usecase.dart';
import 'package:popcorn/modules/movies/domain/entity/recommendations.dart';
import 'package:popcorn/modules/movies/domain/repository/base_movies_repository.dart';

class GetRecommendationsUseCase
    extends BaseUseCase<List<Recommendations>, RecommendationsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationsUseCase({required this.baseMoviesRepository});

  @override
  Future<Either<Failure, List<Recommendations>>> call(
      RecommendationsParameters parameters) async {
    return await baseMoviesRepository.getRecommendations(parameters);
  }
}

class RecommendationsParameters extends Equatable {
  final int id;

  const RecommendationsParameters({required this.id});

  @override
  List<Object> get props => [id];
}
