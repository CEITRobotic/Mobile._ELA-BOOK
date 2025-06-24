import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to DetailPage'),
          onPressed: () {
            Navigator.pushNamed(context, "/detail");
          },
        ),
      ),
    );
  }
}
