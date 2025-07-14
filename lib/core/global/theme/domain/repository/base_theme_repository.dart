import 'dart:async';

import 'package:popcorn/core/global/theme/domain/usecase/save_theme_data_usecase.dart';

abstract class BaseThemeRepository {
  FutureOr<bool> loadThemeData();
  FutureOr<bool> saveThemeData(SaveThemeDataParameters parameters);
}
