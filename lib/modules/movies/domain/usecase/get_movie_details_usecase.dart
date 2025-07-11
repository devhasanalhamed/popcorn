import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:popcorn/core/error/failure.dart';
import 'package:popcorn/core/usecase/base_usecase.dart';
import 'package:popcorn/modules/movies/domain/entity/movie_details.dart';
import 'package:popcorn/modules/movies/domain/repository/base_movies_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUsecase<MovieDetails, MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase({
    required this.baseMoviesRepository,
  });

  @override
  Future<Either<Failure, MovieDetails>> call(
      MovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;
  const MovieDetailsParameters({
    required this.movieId,
  });

  @override
  List<Object?> get props => [movieId];
}
