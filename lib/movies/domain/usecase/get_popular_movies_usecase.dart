import 'package:dartz/dartz.dart';
import 'package:popcorn/core/error/failure.dart';
import 'package:popcorn/movies/data/models/movie_model.dart';
import 'package:popcorn/movies/domain/repository/base_movies_repository.dart';

class GetPopularMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase({
    required this.baseMoviesRepository,
  });

  Future<Either<Failure, List<MovieModel>>> execute() async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
