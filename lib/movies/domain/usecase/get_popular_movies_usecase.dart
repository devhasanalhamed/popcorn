import 'package:popcorn/movies/domain/entity/movide.dart';
import 'package:popcorn/movies/domain/repository/base_movies_repository.dart';

class GetPopularMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase({
    required this.baseMoviesRepository,
  });

  Future<List<Movie>> execute() async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
