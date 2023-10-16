import 'package:popcorn/movies/domain/entity/recommendations.dart';

class RecommendationsModel extends Recommendations {
  const RecommendationsModel({
    required super.id,
    required super.backdropPath,
  });

  factory RecommendationsModel.fromJson(Map<String, dynamic> json) =>
      RecommendationsModel(
        id: json['id'],
        backdropPath: json['backdrop_path'],
      );
}
