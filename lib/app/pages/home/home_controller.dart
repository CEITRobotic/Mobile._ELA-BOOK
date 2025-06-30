import 'package:flutter/material.dart';
import 'home_presenter.dart';

class HomeController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final HomePresenter presenter = HomePresenter();

  Future<String> login() async {
    final username = usernameController.text;
    final password = passwordController.text;
    return await presenter.login(username, password);
  }
}

