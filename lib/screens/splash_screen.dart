import 'package:flutter/material.dart';
import '../utils/preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  Future<void> _checkSession() async {
    final keepLoggedIn = await Preferences.getKeepLoggedIn();
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacementNamed(context, keepLoggedIn ? '/home' : '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
