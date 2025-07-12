import 'package:popcorn/modules/series/domain/entity/series_details.dart';
import 'package:popcorn/modules/series/data/model/genre_model.dart.dart';

class SeriesDetailsModel extends SeriesDetails {
  const SeriesDetailsModel({
    required super.seriesId,
    required super.name,
    required super.backdropPath,
    required super.genres,
    required super.overview,
    required super.releaseDate,
    required super.numberOfSeasons,
    required super.voteAverage,
  });

  factory SeriesDetailsModel.fromJson(Map<String, dynamic> json) =>
      SeriesDetailsModel(
        seriesId: json['id'],
        name: json['name'],
        backdropPath: json['backdrop_path'],
        genres: List.from(json['genres'].map((g) => GenreModel.fromJson(g))),
        overview: json['overview'],
        releaseDate: json['first_air_date'],
        numberOfSeasons: json['number_of_seasons'],
        voteAverage: json['vote_average'].toDouble(),
      );
}
