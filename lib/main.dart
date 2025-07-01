import 'package:flutter/material.dart';
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
    );
  }
}

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
}
