import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  ///Constants
  static String basePath = dotenv.env['BASE_URL']!;
  static String apiKey = 'api_key=${dotenv.env['API_KEY']!}';
  static String moviePath = '$basePath/movie';
  static String nowPlayingMoviesPath = '$moviePath/now_playing?$apiKey';
  static String popularMoviesPath = '$moviePath/popular?$apiKey';
  static String topRatedMoviesPath = '$moviePath/top_rated?$apiKey';
  static String baseImageUrl = dotenv.env['BASE_IMAGE_URL']!;

  ///Functions
  static String movieDetailPath(int movieId) => '$moviePath/$movieId?$apiKey';

  static String recommendationsPath(int movieId) =>
      '$moviePath/$movieId/recommendations?$apiKey';

  static String imageUrl(String path) => '$baseImageUrl$path';
}
