class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'api_key=944496b8feb259fafe467ef6f4d38c80';
  static const String movieUrl = '$baseUrl/movie';
  static const String nowPlayingMoviesUrl = '$movieUrl/now_playing?$apiKey';
  static const String popularMoviesUrl = '$movieUrl/popular?$apiKey';
  static const String topRatedMoviesUrl = '$movieUrl/top_rated?$apiKey';
}
