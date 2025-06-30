import 'package:ela_book/barrel/novel.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logging/logging.dart';
import 'firebase_options.dart';
import 'init_novels.dart';

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
  InitNovels().init();
  _setupLogging();

  final novels = await GetNovelAll(NovelRepositoryImpl())();
  for (var novel in novels) {
    print('Novel name: ${novel.name}, creator: ${novel.creator}');
  }

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

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print(
      '${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}',
    );
  });
}
