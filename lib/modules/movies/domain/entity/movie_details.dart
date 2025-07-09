import 'package:equatable/equatable.dart';
import 'package:popcorn/modules/movies/domain/entity/genres.dart';

class MovieDetails extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String backdropPath;
  final List<Genres> genres;
  final int runtime;
  final double voteAverage;
  final String releaseDate;

  const MovieDetails({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.genres,
    required this.runtime,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        genres,
        title,
        overview,
        runtime,
        id,
        releaseDate,
        voteAverage,
      ];
}
