import 'package:popcorn/core/global/theme/domain/usecase/save_theme_data_usecase.dart';
import 'package:popcorn/core/services/local_storage_service.dart';

abstract class BaseThemeLocalDataSource {
  Future<bool> saveThemeData(SaveThemeDataParameters parameters);
  Future<bool> loadThemeData();
}

class ThemeLocalDataSource extends BaseThemeLocalDataSource {
  final LocalStorageService localStorageService;

  ThemeLocalDataSource({required this.localStorageService});

  @override
  Future<bool> loadThemeData() async {
    final isDark = localStorageService.getTheme();
    print('load theme: $isDark');
    return isDark;
  }

  @override
  Future<bool> saveThemeData(SaveThemeDataParameters parameters) {
    final isDark = localStorageService.setTheme(parameters.isDark);
    print('theme saved to : $isDark');
    return isDark;
  }
}
