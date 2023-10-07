import 'package:popcorn/movies/domain/entity/movide.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropBath,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        title: json['title'],
        backdropBath: json['backdrop_bath'],
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
        overview: json['overview'],
        voteAverage: json['vote_average'],
      );
}
