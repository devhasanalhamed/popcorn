import 'package:popcorn/modules/series/domain/entity/series_recommendation.dart';

class SeriesRecommendationModel extends SeriesRecommendation {
  const SeriesRecommendationModel({
    required super.id,
    required super.backdropPath,
  });

  factory SeriesRecommendationModel.fromJson(Map<String, dynamic> json) =>
      SeriesRecommendationModel(
        id: json['id'],
        backdropPath: json['backdrop_path'] ?? json['poster_path'] ?? '',
      );
}
