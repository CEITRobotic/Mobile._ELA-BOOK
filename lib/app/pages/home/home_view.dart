import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final List<String> imageUrls = [
    'assets/images/ads_imgs/1.jpg',
    'assets/images/ads_imgs/2.jpg',
    'assets/images/ads_imgs/3.jpg',
  ];

  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Column(
        children: [
          SizedBox(height: 20),
          CarouselSlider(
            items:
                imageUrls.map((url) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      url,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                }).toList(),
            carouselController: _controller,
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                imageUrls.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 5.0,
                      height: 5.0,
                      margin: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 4.0,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _current == entry.key
                                ? const Color.fromARGB(255, 249, 37, 37)
                                : Colors.grey,
                      ),
                    ),
                  );
                }).toList(),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('Go to DetailPage'),
            onPressed: () {
              Navigator.pushNamed(context, "/detail");
            },
          ),
        ],
      ),
    );
  }
}
