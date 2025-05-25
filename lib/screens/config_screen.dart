import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:pmsn2025/utils/preferences.dart';
import 'package:pmsn2025/utils/theme_provider.dart';
import 'package:pmsn2025/utils/user_provider.dart';

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
  final List<String> _fonts = [
    'Roboto',
    'Times New Roman',
    'Courier New',
    'EncodeSans',
    'Montserrat',
    'PlaypenSansArabic',
    'RobotoCondensed',
    'WDXLLubrifontTC'
  ];

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
      _selectedFont = _fonts.contains(font) ? font : 'Roboto';
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
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final avatarPath = _avatar?.path ?? '';

    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('El nombre es obligatorio')),
      );
      return;
    } else if (name.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('El nombre debe tener al menos 4 caracteres')),
      );
      return;
    }

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('El correo es obligatorio')),
      );
      return;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('El correo no es válido')),
      );
      return;
    }

    if (password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('La contraseña es obligatoria')),
      );
      return;
    } else if (password.length < 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('La contraseña debe tener al menos 5 caracteres')),
      );
      return;
    }

    if (avatarPath.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Debes seleccionar una imagen de perfil')),
      );
      return;
    }

    if (!File(avatarPath).existsSync()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('La imagen seleccionada no existe o no es válida')),
      );
      return;
    }

    final userProvider = Provider.of<UserProvider>(context, listen: false);
    await userProvider.updateUser(
      name: name,
      email: email,
      avatar: avatarPath,
    );
    await Preferences.setUserData(
      name: name,
      email: email,
      avatarPath: avatarPath,
      password: password,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Datos del usuario actualizados')),
    );
  }

  void _pickColor(
    BuildContext context,
    Color currentColor,
    ValueChanged<Color> onColorChanged,
  ) {
    Color tempColor = currentColor;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Selecciona un color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: currentColor,
              onColorChanged: (color) => tempColor = color,
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text('Seleccionar'),
              onPressed: () {
                onColorChanged(tempColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Configuraciones'),
        backgroundColor: themeProvider.secondaryColor,
      ),
      backgroundColor: themeProvider.primaryColor,
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
            SizedBox(height: 15),
            const Divider(),
            SizedBox(height: 15),
            _buildSectionTitle('Personalización'),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tema visual',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    DropdownButton<String>(
                      value: _selectedTheme,
                      isExpanded: true,
                      items: ['light', 'dark'].map((theme) {
                        return DropdownMenuItem(
                          value: theme,
                          child: Text(theme == 'light' ? 'Claro' : 'Oscuro'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          final themeProvider = Provider.of<ThemeProvider>(
                              context,
                              listen: false);
                          themeProvider.setTheme(value);

                          if (value == 'light') {
                            themeProvider.setPrimaryColor(Colors.white);
                            themeProvider.setSecondaryColor(Colors.blue);
                          } else {
                            themeProvider.setPrimaryColor(Colors.grey[850]!);
                            themeProvider.setSecondaryColor(Colors.deepPurple);
                          }

                          setState(() => _selectedTheme = value);
                        }
                      },
                    ),
                    SizedBox(height: 16),
                    Text('Colores',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            icon: Icon(Icons.color_lens_outlined),
                            label: Text('Fondo'),
                            onPressed: () => _pickColor(
                              context,
                              themeProvider.primaryColor,
                              (color) => themeProvider.setPrimaryColor(color),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton.icon(
                            icon: Icon(Icons.format_color_fill),
                            label: Text('AppBar'),
                            onPressed: () => _pickColor(
                              context,
                              themeProvider.secondaryColor,
                              (color) => themeProvider.setSecondaryColor(color),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Fuente',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    DropdownButton<String>(
                      value: _selectedFont,
                      isExpanded: true,
                      items: _fonts.map((font) {
                        return DropdownMenuItem<String>(
                          value: font,
                          child: Text(
                            font,
                            style: TextStyle(fontFamily: font),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          final themeProvider = Provider.of<ThemeProvider>(
                              context,
                              listen: false);
                          themeProvider.setFont(value);
                          setState(() => _selectedFont = value);
                        }
                      },
                    ),
                  ],
                ),
              ),
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
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
