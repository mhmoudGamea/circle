import 'package:circle/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static final prefs = getIt<SharedPreferences>();

  static String? get(String key) => prefs.getString(key);

  static Future<bool> set(String key, String value) async =>
      await prefs.setString(key, value);

  static isExist(String key) => prefs.containsKey(key);

  static Future<bool> clear() async => await prefs.clear();
}
