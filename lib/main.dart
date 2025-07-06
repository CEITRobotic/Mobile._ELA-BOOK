import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logging/logging.dart';
import 'package:ela_book/data/models/rent_model.dart';
import 'firebase_options.dart';
import 'init_novels.dart';

import 'app/pages/intro/intro_view.dart';
import 'app/pages/login/login_view.dart';
import 'app/pages/register/register_view.dart';
import 'app/pages/home/home_view.dart';
import 'app/pages/detail/detail_view.dart';
import 'app/pages/rent/rent_view.dart';
import 'app/pages/purchase/purchase_view.dart';
import 'app/pages/library/library_view.dart';
import 'app/pages/notification/notification_view.dart';

// import 'package:ela_book/barrel/auth.dart';
// import 'package:ela_book/barrel/novel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  InitNovels().init();
  _setupLogging();

  // final user = User(
  //   email: 'johndo1234@gmail.com',
  //   password: '12345asdb',
  // );
  // final status = await LoginUser(AuthRepositoryImpl())(
  //   user.email,
  //   user.password,
  // );
  // print(status);

  // final novels = await GetNovelAll(NovelRepositoryImpl())();
  // for (var novel in novels) {
  //   print(novel.id);
  //   await DislikeNovel(NovelRepositoryImpl())(novel.id);
  // }

  runApp(MyApp());
}

final rentModel = RentModel(
  title: "ພຽງໃຈໃນຄວາມຝັນ",
  author: "ອີຫຼ້າບຸກ",
  pricePerDay: 10.0,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => IntroView());
          case '/login':
            return MaterialPageRoute(builder: (_) => LoginView());
          case '/register':
            return MaterialPageRoute(builder: (_) => RegisterView());
          case '/home':
            return MaterialPageRoute(builder: (_) => HomeView());
          case '/detail':
            return MaterialPageRoute(builder: (_) => DetailView());
          case '/rent-book':
            return MaterialPageRoute(builder: (_) => RentView(rentModel: rentModel));
          case '/purchase':
            return MaterialPageRoute(builder: (_) => PurchaseView());
          case '/library':
            return MaterialPageRoute(builder: (_) => LibraryView());
          case '/notification':
            return MaterialPageRoute(builder: (_) => NotificationView());
          default:
            return MaterialPageRoute(
              builder:
                  (_) => Scaffold(body: Center(child: Text('Route not found'))),
            );
        }
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
