class ApiConstants {
  ///Constants
  static const String basePath = 'https://api.themoviedb.org/3';
  static const String apiKey = 'api_key=944496b8feb259fafe467ef6f4d38c80';
  static const String moviePath = '$basePath/movie';
  static const String nowPlayingMoviesPath = '$moviePath/now_playing?$apiKey';
  static const String popularMoviesPath = '$moviePath/popular?$apiKey';
  static const String topRatedMoviesPath = '$moviePath/top_rated?$apiKey';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/original';

  ///Functions
  static String movieDetailPath(int movieId) => '$moviePath/$movieId?$apiKey';
  static String recommendationsPath(int movieId) =>
      '$moviePath/$movieId/recommendations?$apiKey';
  static String imageUrl(String path) => '$baseImageUrl$path';
}
