import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pmsn2025/utils/preferences.dart';
import 'package:pmsn2025/utils/theme_provider.dart';
import 'package:pmsn2025/utils/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class ConfigScreen extends StatefulWidget {
  @override
  _ConfigScreenState createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  File? _avatar;

  String _selectedTheme = 'light';
  String _selectedFont = 'Roboto';
  final List<String> _fonts = ['Roboto', 'Arial', 'Times New Roman'];

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    final userData = await Preferences.getUserData();
    final theme = await Preferences.getTheme();
    final font = await Preferences.getFont();

    setState(() {
      _nameController.text = userData['name'] ?? '';
      _emailController.text = userData['email'] ?? '';
      _passwordController.text = userData['password'] ?? '';
      _avatar = (userData['avatar'] ?? '').isNotEmpty
          ? File(userData['avatar']!)
          : null;
      _selectedTheme = theme;
      _selectedFont = font;
    });
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _avatar = File(picked.path);
      });
    }
  }

  Future<void> _saveUserChanges() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    await userProvider.updateUser(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      avatar: _avatar?.path ?? '',
    );
    await Preferences.setUserData(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      avatarPath: _avatar?.path ?? '',
      password: _passwordController.text,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Datos del usuario actualizados')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Configuraciones'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSectionTitle('Información del Usuario'),
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _avatar != null ? FileImage(_avatar!) : null,
                child:
                    _avatar == null ? Icon(Icons.add_a_photo, size: 50) : null,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nombre completo'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Correo electrónico'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Contraseña'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _saveUserChanges,
              child: Text('Guardar datos'),
            ),
            SizedBox(height: 30),
            _buildSectionTitle('Personalización'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tema'),
                DropdownButton<String>(
                  value: _selectedTheme,
                  items: ['light', 'dark'].map((theme) {
                    return DropdownMenuItem(
                      value: theme,
                      child: Text(theme == 'light' ? 'Claro' : 'Oscuro'),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      themeProvider.setTheme(value);
                      setState(() => _selectedTheme = value);
                    }
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Fuente'),
                DropdownButton<String>(
                  value: _selectedFont,
                  items: _fonts.map((font) {
                    return DropdownMenuItem(
                      value: font,
                      child: Text(font),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      themeProvider.setFont(value);
                      setState(() => _selectedFont = value);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(height: 30),
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
