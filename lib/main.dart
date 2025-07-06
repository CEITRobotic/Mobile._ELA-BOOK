import 'package:flutter/material.dart';
<<<<<<< HEAD
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
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
=======
import 'pages/rent_page.dart';
import 'pages/purchase_page.dart';
import 'pages/library_page.dart';
import 'pages/notification_page.dart'; // ເພີ່ມໜ້ານີ້
import 'models/rent_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ຮ້ານໜັງສື',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
>>>>>>> d96fb9e52a236351a474eaf146ab1aab1b8b3f8c
    );
  }
}

<<<<<<< HEAD
void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print(
      '${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}',
    );
  });
=======
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ຮ້ານໜັງສື ອີຫຼ້າບຸກ"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("ເຊົ່າໜັງສື"),
              onPressed: () {
                final rentModel = RentModel(
                  title: "ພຽງໃຈໃນຄວາມຝັນ",
                  author: "ອີຫຼ້າບຸກ",
                  pricePerDay: 10.0,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RentPage(rentModel: rentModel),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("ຊື້ໜັງສື"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PurchasePage()),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("ຄັງໜັງສື"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LibraryPage()),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("ແຈ້ງເຕືອນ"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
>>>>>>> d96fb9e52a236351a474eaf146ab1aab1b8b3f8c
}
