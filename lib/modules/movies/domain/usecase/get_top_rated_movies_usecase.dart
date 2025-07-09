import 'package:dartz/dartz.dart';
import 'package:popcorn/core/error/failure.dart';
import 'package:popcorn/core/usecase/base_usecase.dart';
import 'package:popcorn/modules/movies/data/model/movie_model.dart';
import 'package:popcorn/modules/movies/domain/repository/base_movies_repository.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<MovieModel>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase({
    required this.baseMoviesRepository,
  });
  @override
  Future<Either<Failure, List<MovieModel>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
