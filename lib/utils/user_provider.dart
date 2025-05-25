import 'package:flutter/material.dart';
import 'preferences.dart';

class UserProvider extends ChangeNotifier {
  String _name = '';
  String _email = '';
  String _avatar = '';

  String get name => _name;
  String get email => _email;
  String get avatar => _avatar;

  Future<void> loadUser() async {
    final data = await Preferences.getUserData();
    _name = data['name'] ?? '';
    _email = data['email'] ?? '';
    _avatar = data['avatar'] ?? '';
    notifyListeners();
  }

  Future<void> updateUser({
    required String name,
    required String email,
    required String avatar,
  }) async {
    final existing = await Preferences.getUserData();
    await Preferences.setUserData(
      name: name,
      email: email,
      avatarPath: avatar,
      password: existing['password'] ?? '',
    );
    await loadUser();
  }
}
