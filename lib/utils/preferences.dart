import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

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

  static Future<void> setPrimaryColor(Color color) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('primaryColor', color.value);
  }

  static Future<Color> getPrimaryColor() async {
    final prefs = await SharedPreferences.getInstance();
    final colorValue = prefs.getInt('primaryColor');
    return colorValue != null ? Color(colorValue) : Colors.white;
  }

  static Future<void> setSecondaryColor(Color color) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('secondaryColor', color.value);
  }

  static Future<Color> getSecondaryColor() async {
    final prefs = await SharedPreferences.getInstance();
    final colorValue = prefs.getInt('secondaryColor');
    return colorValue != null ? Color(colorValue) : Colors.blue;
  }

}
