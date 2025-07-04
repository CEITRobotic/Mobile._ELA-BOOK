import 'package:flutter/material.dart';
import 'register_presenter.dart';

class RegisterController {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final RegisterPresenter presenter = RegisterPresenter();

  Future<String> register() async {
    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    return await presenter.register(username, email, password);
  }

  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
