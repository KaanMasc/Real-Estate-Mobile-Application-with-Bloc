import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String UID_KEY = 'uid';
  static const String TOKEN_KEY = 'token';

  // Kullanıcı bilgilerini SharedPreferences'e kaydeden generic metot
  static Future<void> saveUserInfo<T>(String key, T value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (value is String) {
      await prefs.setString(key, value as String);
    } else if (value is int) {
      await prefs.setInt(key, value as int);
    } else if (value is double) {
      await prefs.setDouble(key, value as double);
    } else if (value is bool) {
      await prefs.setBool(key, value as bool);
    }
  }

  // Kullanıcı bilgilerini SharedPreferences'den alan generic metot
  static Future<T?> getUserInfo<T>(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key) as T?;
  }

  // Kullanıcı çıkış yaptığında SharedPreferences'ten UID ve token'ı silen metot
  static Future<void> removeUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(UID_KEY);
    prefs.remove(TOKEN_KEY);
  }
}
