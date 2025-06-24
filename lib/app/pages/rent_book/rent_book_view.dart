import 'package:flutter/material.dart';

class RentBookView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RentBookPage')),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to BuyBookPage'),
          onPressed: () {
            Navigator.pushNamed(context, "/buy-book");
          },
        ),
      ),
    );
  }
}
