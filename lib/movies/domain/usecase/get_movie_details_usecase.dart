import 'package:dartz/dartz.dart';
import 'package:popcorn/core/error/failure.dart';
import 'package:popcorn/core/usecase/base_usecase.dart';
import 'package:popcorn/movies/domain/entity/movie_details.dart';

class GetMovieDetails extends BaseUseCase<MovieDetails> {
  @override
  Future<Either<Failure, MovieDetails>> call() {
    throw UnimplementedError();
  }
}
