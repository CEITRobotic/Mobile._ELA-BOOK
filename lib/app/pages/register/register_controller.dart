import 'package:flutter/material.dart';
import 'register_presenter.dart';

class RegisterController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final RegisterPresenter presenter = RegisterPresenter();

  Future<String> login() async {
    final username = usernameController.text;
    final password = passwordController.text;
    return await presenter.login(username, password);
  }
}
