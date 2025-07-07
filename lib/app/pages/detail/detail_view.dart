import 'package:ela_book/app/pages/detail/detail_controller.dart';
import 'package:ela_book/data/models/rent_model.dart';
import 'package:flutter/material.dart';
import 'package:ela_book/app/pages/rent/rent_view.dart';
import 'package:ela_book/app/pages/purchase/purchase_view.dart';

class DetailView extends StatelessWidget {
  final Map<String, dynamic> novel;

  const DetailView({super.key, Map<String, dynamic>? novel})
    : novel =
          novel ??
          const {
            'id': '',
            'storyName': '',
            'creatorName': '',
            'story': '',
            'image': '',
            'like': 0,
            'rent': 0,
            'buy': 0,
            'view': 0,
            'tags': [],
            'price': 0.0,
          };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 300,
                pinned: true,
                backgroundColor: Colors.black,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), // 👈 adjust opacity here
                        BlendMode.srcATop,
                      ),
                      child: Image.network(
                        novel['image'] ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ນິຍາຍ',
                        style: TextStyle(
                          fontSize: 20,
                          color: const Color(0xFF9E090F),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        novel['storyName'] ?? '',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.person, color: Colors.grey, size: 16),
                          SizedBox(width: 4),
                          Text(
                            novel['creatorName'] ?? '',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        novel['story'] ?? '',
                        style: TextStyle(color: Colors.white70, height: 1.4),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconText(
                            icon: Icons.favorite,
                            label: '${novel['like'] ?? ''} ຄົນຖືກໃຈເລື່ອງນີ້',
                            color: const Color(0xFF9E090F),
                          ),
                          SizedBox(width: 4),
                          Row(
                            children: [
                              IconText(
                                icon: Icons.visibility_outlined,
                                label: "${novel['view'] ?? ''}",
                              ),
                              SizedBox(width: 12),
                              IconText(
                                icon: Icons.collections_bookmark_outlined,
                                label: "${novel['rent'] ?? ''}",
                              ),
                              SizedBox(width: 12),
                              IconText(
                                icon: Icons.shopping_cart_outlined,
                                label: "${novel['buy'] ?? ''}",
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          HeartButton(novelId: novel['id'] ?? ''),
                          const SizedBox(width: 12),
                          Expanded(
                            child: OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.white),
                                foregroundColor: Colors.white,
                              ),
                              icon: const Icon(
                                Icons.collections_bookmark_outlined,
                              ),
                              label: const Text('ເຊົ່າປື້ມເຂົ້າຄັງ'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => RentView(
                                          rentModel: RentModel(
                                            title: novel['storyName'],
                                            author: novel['creatorName'],
                                            image: novel['image'],
                                            views: novel['view'],
                                            likes: novel['like'],
                                            rating: double.parse(
                                              ((int.tryParse(
                                                            novel['view']
                                                                .toString(),
                                                          ) ??
                                                          0) *
                                                      10 /
                                                      1550)
                                                  .clamp(0, 10)
                                                  .toDouble()
                                                  .toStringAsFixed(2),
                                            ),
                                          ),
                                        ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF9E090F),
                                foregroundColor: Colors.white,
                              ),
                              icon: const Icon(Icons.visibility_outlined),
                              label: const Text('ຊື້ປື້ມອ່ານ'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => PurchaseView(
                                          rentModel: RentModel(
                                            title: novel['storyName'],
                                            author: novel['creatorName'],
                                            image: novel['image'],
                                            views: novel['view'],
                                            likes: novel['like'],
                                            pricePerBook: novel['price'],
                                            tags:
                                                (novel['tag'] ?? [])
                                                    as List<String>,
                                            rating: double.parse(
                                              ((int.tryParse(
                                                            novel['view']
                                                                .toString(),
                                                          ) ??
                                                          0) *
                                                      10 /
                                                      1550)
                                                  .clamp(0, 10)
                                                  .toDouble()
                                                  .toStringAsFixed(2),
                                            ),
                                          ),
                                        ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 16,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IconText extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const IconText({
    super.key,
    required this.icon,
    required this.label,
    this.color = Colors.white70,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 16),
        const SizedBox(width: 4),
        Text(label, style: TextStyle(color: color)),
      ],
    );
  }
}

class HeartButton extends StatefulWidget {
  final String? novelId;
  const HeartButton({super.key, required this.novelId});

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  DetailController controller = DetailController();
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    _loadLikeStatus();
  }

  void _loadLikeStatus() async {
    bool status = await controller.checkLikeStatus(widget.novelId);
    setState(() {
      isLiked = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        bool newStatus = await controller.toggleLike(widget.novelId, isLiked);
        setState(() {
          isLiked = newStatus;
        });
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Center(
          child: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            size: 20,
            color: isLiked ? Colors.red : Colors.white,
          ),
        ),
      ),
    );
  }
}
