import 'package:equatable/equatable.dart';

class Series extends Equatable {
  final int id;
  final String name;
  final String backdropPath;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  const Series(
      {required this.id,
      required this.name,
      required this.backdropPath,
      required this.genreIds,
      required this.overview,
      required this.voteAverage,
      required this.releaseDate});

  @override
  List<Object?> get props => [
        id,
        name,
        backdropPath,
        genreIds,
        overview,
        voteAverage,
        releaseDate,
      ];
}
