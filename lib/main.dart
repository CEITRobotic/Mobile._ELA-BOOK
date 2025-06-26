import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'app/pages/intro/intro_view.dart';
import 'app/pages/login/login_view.dart';
import 'app/pages/register/register_view.dart';
import 'app/pages/home/home_view.dart';
import 'app/pages/detail/detail_view.dart';
import 'app/pages/rent_book/rent_book_view.dart';
import 'app/pages/buy_book/buy_book_view.dart';
import 'app/pages/storage/storage_view.dart';
import 'app/pages/event/event_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
