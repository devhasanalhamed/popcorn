import 'package:popcorn/modules/series/domain/entity/series.dart';

class SeriesModel extends Series {
  const SeriesModel({
    required super.id,
    required super.name,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory SeriesModel.fromJson(Map<String, dynamic> json) => SeriesModel(
        id: json['id'],
        name: json['name'],
        backdropPath: json['backdrop_path'],
        genreIds: List.from(json['genre_ids'].map((e) => e)),
        overview: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
        releaseDate: json['first_air_date'],
      );
}
