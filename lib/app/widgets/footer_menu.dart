import 'package:ela_book/app/pages/home/home_view.dart';
import 'package:ela_book/app/pages/library/library_view.dart';
import 'package:ela_book/app/pages/notification/notification_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FixedBottomBar extends StatefulWidget {
  const FixedBottomBar({super.key});

  @override
  State<FixedBottomBar> createState() => _FixedBottomBarState();
}

class _FixedBottomBarState extends State<FixedBottomBar> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    saveSelectedIndex(index);
  }

  Future<void> saveSelectedIndex(int index) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'indexSelection': index,
    });
  }

  Future<void> loadSelectedIndex() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final doc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (doc.exists &&
        doc.data() != null &&
        doc.data()!.containsKey('indexSelection')) {
      setState(() {
        selectedIndex = doc['indexSelection'] as int;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadSelectedIndex();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: SizedBox(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(0, Icons.explicit, 'ຫນ້າທໍາອິດ'),
              _buildNavItem(
                1,
                Icons.collections_bookmark_outlined,
                'ຄັງຫນັງສື',
              ),
              _buildNavItem(2, Icons.home, 'ການແຈ້ງເຕືອນ'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = selectedIndex == index;
    final color = isSelected ? Colors.red : const Color(0xFF696969);

    return InkWell(
      onTap: () {
        _onItemTapped(index);
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeView()),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LibraryView()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationView()),
            );
            break;
          default:
        }
      },
      child: IconText(icon: icon, label: label, color: color),
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 30),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: color)),
      ],
    );
  }
}
