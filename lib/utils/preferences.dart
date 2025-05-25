import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static Future<void> setKeepLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('keepLoggedIn', value);
  }

  static Future<bool> getKeepLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('keepLoggedIn') ?? false;
  }

  static Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('keepLoggedIn', false);
  }

  static Future<void> setUserData({
    required String name,
    required String email,
    required String avatarPath,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
    await prefs.setString('userEmail', email);
    await prefs.setString('userAvatar', avatarPath);
    await prefs.setString('userPassword', password);
  }

  static Future<Map<String, String>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'name': prefs.getString('userName') ?? '',
      'email': prefs.getString('userEmail') ?? '',
      'avatar': prefs.getString('userAvatar') ?? '',
      'password': prefs.getString('userPassword') ?? '',
    };
  }

  static Future<String> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('theme') ?? 'light';
  }

  static Future<String> getFont() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('font') ?? 'Roboto';
  }
}
