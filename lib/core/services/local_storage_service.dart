import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Theme
  static const String isDarkKey = 'is_dark';
  Future<bool> setTheme(bool isDark) async => _prefs.setBool(isDarkKey, isDark);
  bool getTheme() => _prefs.getBool(isDarkKey) ?? false;
}
