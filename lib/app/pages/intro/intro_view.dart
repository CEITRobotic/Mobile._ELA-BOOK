import 'package:flutter/material.dart';
import 'package:ela_book/app/pages/intro/intro_second_page_view.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SecondPageIntro()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF970C0C),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'ອີ່',
                    style: TextStyle(
                      fontSize: 105,
                      color: Colors.white,
                      height: 1.0,
                    ),
                  ),
                  TextSpan(
                    text: 'ຫລ້າ',
                    style: TextStyle(
                      fontSize: 55,
                      color: Colors.amber[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Transform.translate(
              offset: const Offset(70, -10),
              child: const Text(
                'ບຸ໊ກກກ',
                style: TextStyle(fontSize: 55, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

