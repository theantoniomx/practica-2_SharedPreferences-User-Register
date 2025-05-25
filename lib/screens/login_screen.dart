import 'package:flutter/material.dart';
import 'package:pmsn2025/utils/global_values.dart';
import 'package:pmsn2025/utils/preferences.dart';
import 'package:pmsn2025/utils/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _keepLoggedIn = false;

  void _login() async {
    final inputEmail = _emailController.text.trim();
    final inputPassword = _passwordController.text.trim();

    if (inputEmail.isEmpty || inputPassword.isEmpty) {
      _showError('Todos los campos son obligatorios.');
      return;
    }

    await Provider.of<UserProvider>(context, listen: false).loadUser();

    GlobalValues.isValidating.value = true;

    await Future.delayed(const Duration(seconds: 2));

    final userData = await Preferences.getUserData();
    final registeredEmail = userData['email'];
    final registeredPassword = userData['password'];

    if (inputEmail == registeredEmail && inputPassword == registeredPassword) {
      await Preferences.setKeepLoggedIn(_keepLoggedIn);
      GlobalValues.isValidating.value = false;

      Navigator.pushReplacementNamed(context, '/home');
    } else {
      GlobalValues.isValidating.value = false;
      _showError('Correo o contraseña incorrectos.');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
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
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 500,
              child: ValueListenableBuilder(
                valueListenable: GlobalValues.isValidating,
                builder: (context, value, child) {
                  return value
                      ? const CircularProgressIndicator()
                      : Container();
                },
              ),
            ),
            Positioned(
              top: 80,
              child: Lottie.asset("assets/tecnm.json", height: 250),
            ),
            Positioned(
              bottom: 30,
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 330,
                width: MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Introduce el correo",
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Introduce la contraseña",
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: _keepLoggedIn,
                          onChanged: (v) =>
                              setState(() => _keepLoggedIn = v ?? false),
                        ),
                        const Text("Mantener sesión iniciada")
                      ],
                    ),
                    GestureDetector(
                      onTap: _login,
                      child: Image.asset(
                        "assets/boton.png",
                        height: 60,
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/register'),
                      child: const Text('Registrarse'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
