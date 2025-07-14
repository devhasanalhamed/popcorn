import 'dart:async';
import 'package:popcorn/core/global/theme/domain/repository/base_theme_repository.dart';

class SaveThemeDataUsecase {
  final BaseThemeRepository baseThemeRepository;

  SaveThemeDataUsecase({required this.baseThemeRepository});

  FutureOr<bool> call(SaveThemeDataParameters parameters) async {
    return await baseThemeRepository
        .saveThemeData(SaveThemeDataParameters(isDark: parameters.isDark));
  }
}

class SaveThemeDataParameters {
  final bool isDark;

  SaveThemeDataParameters({required this.isDark});
}
