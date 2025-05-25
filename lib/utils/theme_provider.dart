import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  String _fontFamily = 'Roboto';

  ThemeMode get themeMode => _themeMode;
  String get fontFamily => _fontFamily;

  Future<void> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme') ?? 'light';
    final font = prefs.getString('font') ?? 'Roboto';

    _themeMode = theme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    _fontFamily = font;
    notifyListeners();
  }

  ThemeData getThemeData() {
    return ThemeData(
      brightness:
          _themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light,
      fontFamily: _fontFamily,
    );
  }

  Future<void> setTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    _themeMode = theme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    await prefs.setString('theme', theme);
    notifyListeners();
  }

  Future<void> setFont(String font) async {
    final prefs = await SharedPreferences.getInstance();
    _fontFamily = font;
    await prefs.setString('font', font);
    notifyListeners();
  }

  Future<void> resetThemeSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', 'light');
    await prefs.setString('font', 'Roboto');

    _themeMode = ThemeMode.light;
    _fontFamily = 'Roboto';
    notifyListeners();
  }
}
