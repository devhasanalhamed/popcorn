import 'dart:async';

import 'package:popcorn/core/global/theme/data/datasource/theme_local_data_source.dart';
import 'package:popcorn/core/global/theme/domain/repository/base_theme_repository.dart';
import 'package:popcorn/core/global/theme/domain/usecase/save_theme_data_usecase.dart';

class ThemeRepository extends BaseThemeRepository {
  final BaseThemeLocalDataSource baseThemeLocalDataSource;

  ThemeRepository({required this.baseThemeLocalDataSource});

  @override
  FutureOr<bool> loadThemeData() async {
    return baseThemeLocalDataSource.loadThemeData();
  }

  @override
  FutureOr<bool> saveThemeData(SaveThemeDataParameters parameters) {
    return baseThemeLocalDataSource.saveThemeData(parameters);
  }
}
