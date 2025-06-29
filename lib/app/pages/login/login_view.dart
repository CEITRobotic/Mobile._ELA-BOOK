import 'package:flutter/material.dart';
import 'login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LoginPage')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextField(
                  controller: controller.usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                ),
                TextField(
                  controller: controller.passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final result = await controller.login();
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(result)));
                  },
                  child: const Text('Login'),
                ),
              ],
            ),

            ElevatedButton(
              child: Text('Go to RegisterPage'),
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
          ],
        ),
      ),
    );
  }
}
