import 'package:get_it/get_it.dart';
import 'package:popcorn/movies/data/datasource/movie_remote_data_source.dart';
import 'package:popcorn/movies/data/repository/movies_repository.dart';
import 'package:popcorn/movies/domain/repository/base_movies_repository.dart';
import 'package:popcorn/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:popcorn/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:popcorn/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:popcorn/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:popcorn/movies/presentation/controller/movie_details_bloc.dart';
import 'package:popcorn/movies/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///BLOC
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl()));

    ///USE CASE
    sl.registerLazySingleton(
        () => GetNowPlayingMoviesUseCase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(
        () => GetPopularMoviesUseCase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(
        () => GetTopRatedMoviesUseCase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(
        () => GetMovieDetailsUseCase(baseMoviesRepository: sl()));

    ///Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(baseMovieRemoteDataSource: sl()));

    ///DATA SOURCE
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
      () => MoviesRemoteDataSource(),
    );
  }
}
