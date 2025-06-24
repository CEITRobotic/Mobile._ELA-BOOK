import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DetailPage')),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to RentBookPage'),
          onPressed: () {
            Navigator.pushNamed(context, "/rent-book");
          },
        ),
      ),
    );
  }
}
