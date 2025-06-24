import 'package:flutter/material.dart';
import 'login_presenter.dart';

class LoginController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final LoginPresenter presenter = LoginPresenter();

  Future<String> login() async {
    final username = usernameController.text;
    final password = passwordController.text;
    return await presenter.login(username, password);
  }
}
