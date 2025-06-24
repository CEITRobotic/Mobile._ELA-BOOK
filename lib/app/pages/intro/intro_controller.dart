import 'package:flutter/material.dart';
import 'intro_presenter.dart';

class IntroController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final IntroPresenter presenter = IntroPresenter();

  Future<String> login() async {
    final username = usernameController.text;
    final password = passwordController.text;
    return await presenter.login(username, password);
  }
}
