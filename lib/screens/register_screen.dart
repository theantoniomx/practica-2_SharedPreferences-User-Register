import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pmsn2025/utils/preferences.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  File? _avatar;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _avatar = File(pickedFile.path);
      });
    }
  }

  void _register() async {
    if (!_formKey.currentState!.validate()) return;

    await Preferences.setUserData(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      avatarPath: _avatar?.path ?? '',
      password: _passwordController.text,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Usuario registrado con éxito')),
    );

    Navigator.pop(context);
  }

  Widget _buildAvatarWithOptions() {
    return Column(
      children: [
        GestureDetector(
          onTap: () => _pickImage(ImageSource.gallery),
          child: CircleAvatar(
            radius: 40,
            backgroundImage: _avatar != null ? FileImage(_avatar!) : null,
            child: _avatar == null
                ? const Icon(Icons.photo_library, size: 40)
                : null,
          ),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () => _pickImage(ImageSource.camera),
          child: const Text("Tomar foto con cámara"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: .5,
            fit: BoxFit.cover,
            image: AssetImage("assets/fondo.png"),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width * .9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Registro',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 48),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildAvatarWithOptions(),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _nameController,
                      decoration:
                          const InputDecoration(labelText: 'Nombre completo'),
                      validator: (value) =>
                          value!.trim().isEmpty ? 'Campo obligatorio' : null,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                          labelText: 'Correo electrónico'),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Campo obligatorio';
                        }
                        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                        if (!emailRegex.hasMatch(value.trim())) {
                          return 'Correo no válido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration:
                          const InputDecoration(labelText: 'Contraseña'),
                      validator: (value) =>
                          value!.isEmpty ? 'Campo obligatorio' : null,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _register,
                      child: const Text('Registrarse'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
