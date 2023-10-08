import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropBath;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;

  const Movie({
    required this.id,
    required this.title,
    required this.backdropBath,
    required this.genreIds,
    required this.overview,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        backdropBath,
        genreIds,
        overview,
        voteAverage,
      ];
}
