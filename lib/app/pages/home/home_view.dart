import 'package:ela_book/app/pages/detail/detail_view.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_controller.dart';

final controller = HomeController();

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> imageUrls = [
    'https://raw.githubusercontent.com/CEITRobotic/Mobile._ELA-BOOK/main/assets/images/ads_imgs/1.jpg',
    'https://raw.githubusercontent.com/CEITRobotic/Mobile._ELA-BOOK/main/assets/images/ads_imgs/2.jpg',
    'https://raw.githubusercontent.com/CEITRobotic/Mobile._ELA-BOOK/main/assets/images/ads_imgs/3.jpg',
  ];

  Map<String, List<Map<String, String>>> comics = {
    'ໄວຫນຸ່ມ': [],
    'ຄວາມຮັກ': [],
    'ອື່ນໆ': [],
  };
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final results = await Future.wait([
      controller.mapDatasFromTag("ໄວຫນຸ່ມ"),
      controller.mapDatasFromTag("ຄວາມຮັກ"),
      controller.mapAllDatas(),
    ]);
    setState(() {
      comics['ໄວຫນຸ່ມ'] = results[0];
      comics['ຄວາມຮັກ'] = results[1];
      comics['ອື່ນໆ'] = results[2];
      isLoading = false;
    });
  }

  final CarouselSliderController _controllerSilder = CarouselSliderController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          color: Colors.blue,
          child: Center(child: Text('Fixed Bottom Bar')),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ນິຍາຍ',
                    style: TextStyle(
                      fontSize: 25,
                      color: const Color(0xFF9E090F),
                      decorationColor: const Color(0xFF9E090F),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/profile.svg',
                    width: 29,
                    height: 29,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // ✅ Carousel section
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
              carouselController: _controllerSilder,
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

            // ✅ Carousel indicators
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  imageUrls.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controllerSilder.animateToPage(entry.key),
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(horizontal: 4.0),
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

            const SizedBox(height: 20),

            // ✅ Comic section title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  comics.keys.toList()[0],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // ✅ Horizontal comic list
            SizedBox(
              height: 215,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: comics[comics.keys.toList()[0]]!.length,
                itemBuilder: (context, index) {
                  return ComicCard(
                    item: comics[comics.keys.toList()[0]]![index],
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            // ✅ Comic section title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  comics.keys.toList()[1],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // ✅ Horizontal comic list
            SizedBox(
              height: 215,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: comics[comics.keys.toList()[1]]!.length,
                itemBuilder: (context, index) {
                  return ComicCard(
                    item: comics[comics.keys.toList()[1]]![index],
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            // ✅ Comic section title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  comics.keys.toList()[1],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // ✅ Horizontal comic list
            SizedBox(
              height: 215,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: comics[comics.keys.toList()[1]]!.length,
                itemBuilder: (context, index) {
                  return ComicCard(
                    item: comics[comics.keys.toList()[1]]![index],
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // ✅ Comic section title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  comics.keys.toList()[2],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // ✅ Horizontal comic list
            SizedBox(
              height: 215,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: comics[comics.keys.toList()[2]]!.length,
                itemBuilder: (context, index) {
                  return ComicCard(
                    item: comics[comics.keys.toList()[2]]![index],
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ComicCard extends StatelessWidget {
  final Map<String, String> item;

  const ComicCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.increaseView(item['id']);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailView(novel: item)),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 12),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Comic image
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  item['image'] ?? '',
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // ✅ Comic text + icons
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/feather.svg',
                          width: 8,
                          height: 10,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          item['storyName'] ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['creatorName'] ?? '',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.remove_red_eye,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          item['view'] ?? '',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(width: 12),
                        Icon(
                          Icons.favorite_border,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          item['like'] ?? '',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
