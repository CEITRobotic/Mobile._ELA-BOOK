import 'package:flutter/material.dart';

import 'app/pages/intro/intro_view.dart';
import 'app/pages/login/login_view.dart';
import 'app/pages/register/register_view.dart';
import 'app/pages/home/home_view.dart';
import 'app/pages/detail/detail_view.dart';
import 'app/pages/rent_book/rent_book_view.dart';
import 'app/pages/buy_book/buy_book_view.dart';
import 'app/pages/storage/storage_view.dart';
import 'app/pages/event/event_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Example',
      initialRoute: '/',
      routes: {
        '/': (context) => IntroView(),
        '/login': (context) => LoginView(),
        '/register': (context) => RegisterView(),
        '/home': (context) => HomeView(),
        '/detail': (context) => DetailView(),
        '/rent-book': (context) => RentBookView(),
        '/buy-book': (context) => BuyBookView(),
        '/storage': (context) => StorageView(),
        '/event': (context) => EventView(),
      },
    );
  }
}
