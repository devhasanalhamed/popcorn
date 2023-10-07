import 'package:popcorn/movies/domain/entity/movide.dart';
import 'package:popcorn/movies/domain/repository/base_movies_repository.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase({
    required this.baseMoviesRepository,
  });

  Future<List<Movie>> execute() async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
