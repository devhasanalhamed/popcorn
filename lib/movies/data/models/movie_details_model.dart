import 'package:popcorn/movies/data/models/genres_model.dart';
import 'package:popcorn/movies/domain/entity/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.backdropPath,
    required super.genres,
    required super.runtime,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        backdropPath: json['backdrop_path'],
        genres: List<GenresModel>.from(
            json['genres'].map((x) => GenresModel.fromJson(x))),
        runtime: json['runtime'],
        voteAverage: json['vote_average'].toDouble(),
        releaseDate: json['release_date'],
      );
}
