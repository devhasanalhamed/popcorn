import 'package:get_it/get_it.dart';
import 'package:popcorn/core/global/theme/controller/theme_bloc.dart';
import 'package:popcorn/core/global/theme/data/datasource/theme_local_data_source.dart';
import 'package:popcorn/core/global/theme/data/repository/theme_repository.dart';
import 'package:popcorn/core/global/theme/domain/usecase/load_theme_data_usecase.dart';
import 'package:popcorn/core/global/theme/domain/usecase/save_theme_data_usecase.dart';
import 'package:popcorn/core/services/local_storage_service.dart';
import 'package:popcorn/modules/movies/data/datasource/movie_remote_data_source.dart';
import 'package:popcorn/modules/movies/data/repository/movies_repository.dart';
import 'package:popcorn/modules/movies/domain/repository/base_movies_repository.dart';
import 'package:popcorn/modules/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:popcorn/modules/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:popcorn/modules/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:popcorn/modules/movies/domain/usecase/get_recommendations.dart';
import 'package:popcorn/modules/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:popcorn/modules/movies/presentation/controller/movie_details_bloc.dart';
import 'package:popcorn/modules/movies/presentation/controller/movies_bloc.dart';
import 'package:popcorn/modules/series/data/datasource/series_remote_data_source.dart';
import 'package:popcorn/modules/series/data/repository/series_repository.dart';
import 'package:popcorn/modules/series/domain/repository/base_series_repository.dart';
import 'package:popcorn/modules/series/domain/usecase/get_airing_today_series_usecase.dart';
import 'package:popcorn/modules/series/domain/usecase/get_popular_series_usecase.dart';
import 'package:popcorn/modules/series/domain/usecase/get_series_details_usecase.dart';
import 'package:popcorn/modules/series/domain/usecase/get_series_recommendations_usecase.dart';
import 'package:popcorn/modules/series/domain/usecase/get_top_reated_series_usecase.dart';
import 'package:popcorn/modules/series/presentation/controller/series_bloc.dart';
import 'package:popcorn/modules/series/presentation/controller/series_details_bloc.dart';

// first get an instance
final sl = GetIt.instance;

class ServicesLocator {
  static void init() {
    /// Theme bloc
    sl.registerFactory(() => ThemeBloc(
        loadThemeDataUsecase: sl<LoadThemeDataUsecase>(),
        saveThemeDataUsecase: sl<SaveThemeDataUsecase>()));

    /// Theme usecaase
    sl.registerLazySingleton(
      () => LoadThemeDataUsecase(baseThemeRepository: sl<ThemeRepository>()),
    );
    sl.registerLazySingleton(
      () => SaveThemeDataUsecase(baseThemeRepository: sl<ThemeRepository>()),
    );

    /// Theme repository
    sl.registerLazySingleton(
      () =>
          ThemeRepository(baseThemeLocalDataSource: sl<ThemeLocalDataSource>()),
    );

    /// Theme database
    sl.registerLazySingleton(
      () => ThemeLocalDataSource(localStorageService: LocalStorageService()),
    );

    /// Movies bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));

    /// Series bloc
    sl.registerFactory(
      () => SeriesBloc(sl(), sl(), sl()),
    );
    sl.registerFactory(
      () => SeriesDetailsBloc(sl(), sl()),
    );

    /// Movies use case
    sl.registerLazySingleton(
        () => GetNowPlayingMoviesUseCase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(
        () => GetPopularMoviesUseCase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(
        () => GetTopRatedMoviesUseCase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(
        () => GetMovieDetailsUseCase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(
        () => GetRecommendationsUseCase(baseMoviesRepository: sl()));

    /// Series use case
    sl.registerLazySingleton(
      () => GetAiringTodaySeriesUsecase(baseSeriesRepository: sl()),
    );
    sl.registerLazySingleton(
      () => GetPopularSeriesUsecase(baseSeriesRepository: sl()),
    );
    sl.registerLazySingleton(
      () => GetTopReatedSeriesUsecase(baseSeriesRepository: sl()),
    );
    sl.registerLazySingleton(
      () => GetSeriesDetailsUsecase(baseSeriesRepository: sl()),
    );
    sl.registerLazySingleton(
      () => GetSeriesRecommendationsUsecase(baseSeriesRepository: sl()),
    );

    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
      () => MoviesRepository(baseMovieRemoteDataSource: sl()),
    );
    sl.registerLazySingleton<BaseSeriesRepository>(
      () => SeriesRepository(baseSeriesRemoteDataSource: sl()),
    );

    /// Date source
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
      () => MoviesRemoteDataSource(),
    );
    sl.registerLazySingleton<BaseSeriesRemoteDataSource>(
      () => SeriesRemoteDataSource(),
    );
  }
}
