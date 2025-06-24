import 'package:flutter/material.dart';

class StorageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StoragePage')),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to EventPage'),
          onPressed: () {
            Navigator.pushNamed(context, "/event");
          },
        ),
      ),
    );
  }
}
