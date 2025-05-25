import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  String _fontFamily = 'Roboto';
  Color _primaryColor = Colors.white;
  Color _secondaryColor = Colors.blue;

  ThemeMode get themeMode => _themeMode;
  String get fontFamily => _fontFamily;
  Color get primaryColor => _primaryColor;
  Color get secondaryColor => _secondaryColor;

  Future<void> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme') ?? 'light';
    final font = prefs.getString('font') ?? 'Roboto';
    final primaryValue = prefs.getInt('primaryColor') ?? Colors.white.value;
    final secondaryValue = prefs.getInt('secondaryColor') ?? Colors.blue.value;

    _themeMode = theme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    _fontFamily = font;
    _primaryColor = Color(primaryValue);
    _secondaryColor = Color(secondaryValue);

    notifyListeners();
  }

  ThemeData getThemeData() {
    return ThemeData(
      brightness:
          _themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light,
      fontFamily: _fontFamily,
      scaffoldBackgroundColor: _primaryColor,
      primaryColor: _primaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: _secondaryColor,
      ),
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

  Future<void> setPrimaryColor(Color color) async {
    final prefs = await SharedPreferences.getInstance();
    _primaryColor = color;
    await prefs.setInt('primaryColor', color.value);
    notifyListeners();
  }

  Future<void> setSecondaryColor(Color color) async {
    final prefs = await SharedPreferences.getInstance();
    _secondaryColor = color;
    await prefs.setInt('secondaryColor', color.value);
    notifyListeners();
  }

  Future<void> resetThemeSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', 'light');
    await prefs.setString('font', 'Roboto');
    await prefs.setInt('primaryColor', Colors.white.value);
    await prefs.setInt('secondaryColor', Colors.blue.value);

    _themeMode = ThemeMode.light;
    _fontFamily = 'Roboto';
    _primaryColor = Colors.white;
    _secondaryColor = Colors.blue;
    notifyListeners();
  }
}
