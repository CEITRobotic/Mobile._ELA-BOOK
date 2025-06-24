import 'package:flutter/material.dart';

class BuyBookView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BuyBookPage')),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to StoragePage'),
          onPressed: () {
            Navigator.pushNamed(context, "/storage");
          },
        ),
      ),
    );
  }
}
