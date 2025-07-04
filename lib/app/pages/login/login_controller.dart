import 'package:flutter/material.dart';
import 'login_presenter.dart';

class LoginController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final LoginPresenter presenter = LoginPresenter();

  Future<String> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    return await presenter.login(email, password);
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
