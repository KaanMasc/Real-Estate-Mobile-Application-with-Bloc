import 'package:shared_preferences/shared_preferences.dart';

class AppCacheHelper {
  AppCacheHelper._();
  static AppCacheHelper instance = AppCacheHelper._();

  late SharedPreferences sharedPreferences;

  Future<void> setup() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }


  // Token'ı kaydetmek için
  Future<void> saveToken(String token) async {
    await sharedPreferences.setString('token', token);
  }

  // Kullanıcı UID'sini kaydetmek için
  Future<void> saveUID(String uid) async {
    await sharedPreferences.setString('uid', uid);
  }

  // Token'ı almak için
  String getToken() {
    return sharedPreferences.getString('token') ?? '';
  }

  // Kullanıcı UID'sini almak için
  String getUID() {
    return sharedPreferences.getString('uid') ?? '';
  }
}
