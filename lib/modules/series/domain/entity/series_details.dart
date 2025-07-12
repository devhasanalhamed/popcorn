import 'package:equatable/equatable.dart';
import 'package:popcorn/modules/series/domain/entity/genre.dart';

class SeriesDetails extends Equatable {
  final int seriesId;
  final String name;
  final String backdropPath;
  final List<Genre> genres;
  final String overview;
  final String releaseDate;
  final int numberOfSeasons;
  final double voteAverage;

  const SeriesDetails({
    required this.seriesId,
    required this.name,
    required this.backdropPath,
    required this.genres,
    required this.overview,
    required this.releaseDate,
    required this.numberOfSeasons,
    required this.voteAverage,
  });

  @override
  List<Object> get props {
    return [
      seriesId,
      name,
      backdropPath,
      genres,
      overview,
      releaseDate,
      numberOfSeasons,
      voteAverage,
    ];
  }
}
