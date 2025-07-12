import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  /// Authentication
  static String basePath = dotenv.env['BASE_URL']!;
  static String apiKey = 'api_key=${dotenv.env['API_KEY']!}';

  /// Movies
  static String moviePath = '$basePath/movie';
  static String nowPlayingMoviesPath = '$moviePath/now_playing?$apiKey';
  static String popularMoviesPath = '$moviePath/popular?$apiKey';
  static String topRatedMoviesPath = '$moviePath/top_rated?$apiKey';
  static String baseImageUrl = dotenv.env['BASE_IMAGE_URL']!;

  /// Movies Functions
  static String movieDetailPath(int movieId) => '$moviePath/$movieId?$apiKey';

  static String recommendationsPath(int movieId) =>
      '$moviePath/$movieId/recommendations?$apiKey';

  /// TV Series
  static String seriesPath = '$basePath/tv';
  static String airingTodaySeriesPath = '$seriesPath/airing_today?$apiKey';
  static String popularSeriesPath = '$seriesPath/popular?$apiKey';
  static String topRatedSeriesPath = '$seriesPath/top_rated?$apiKey';

  /// Series Functions
  static String seriesDetailsPath(int seriesId) =>
      '$seriesPath/$seriesId?$apiKey';

  static String seriesRecommendationsPath(int seriesId) =>
      '$seriesPath/$seriesId/recommendations?$apiKey';

  /// Common Functions
  static String imageUrl(String path) => '$baseImageUrl$path';
}
