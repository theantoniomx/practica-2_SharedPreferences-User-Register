import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pmsn2025/utils/preferences.dart';
import 'package:pmsn2025/utils/theme_provider.dart';
import 'package:pmsn2025/utils/user_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Práctica 2 - SharedPreferences'),
        backgroundColor: themeProvider.secondaryColor,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: themeProvider.secondaryColor,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: themeProvider.secondaryColor,
                ),
                accountName: Text(userProvider.name),
                accountEmail: Text(userProvider.email),
                currentAccountPicture: userProvider.avatar.isNotEmpty
                    ? CircleAvatar(
                        backgroundImage: FileImage(File(userProvider.avatar)))
                    : CircleAvatar(child: Icon(Icons.person)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.design_services),
              title: Text('Práctica Figma'),
              subtitle: Text('Frontend App'),
              trailing: Icon(Icons.chevron_right),
              onTap: () => Navigator.pushNamed(context, "/figma"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuraciones'),
              trailing: Icon(Icons.chevron_right),
              onTap: () => Navigator.pushNamed(context, '/config'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Cerrar sesión'),
              trailing: Icon(Icons.chevron_right),
              onTap: () async {
                await Preferences.clearSession();
                final themeProvider =
                    Provider.of<ThemeProvider>(context, listen: false);
                await themeProvider.resetThemeSettings();
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      backgroundColor: themeProvider.primaryColor,
      body: Center(
        child: Text(
          '¡Bienvenid@, ${userProvider.name}!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
