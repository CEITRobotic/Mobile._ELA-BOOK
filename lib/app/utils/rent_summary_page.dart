import 'package:flutter/material.dart';
import 'package:ela_book/data/models/rent_model.dart';

class RentSummaryPage extends StatelessWidget {
  final RentModel rentModel;
  final String borrowerName;
  final DateTime borrowDate;
  final DateTime returnDate;
  final double totalPrice;

  const RentSummaryPage({
    Key? key,
    required this.rentModel,
    required this.borrowerName,
    required this.borrowDate,
    required this.returnDate,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final days = returnDate.difference(borrowDate).inDays;

    return Scaffold(
      appBar: AppBar(title: Text("ສະຫຼຸບການເຊົ່າ")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/Rakkhuekarnderntharng.jpg',
                  width: 100,
                  height: 140,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("ຊື່: ຮັກຄືການເດິນທາງ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text("ຜູ້ຂຽນ: ຈັນມາລາ ແກ້ວໄຊສີ"),
                      SizedBox(height: 4),
                      Text("ເຂົ້າເບິ່ງ: 1234 ຄັ້ງ"),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.red, size: 20),
                          SizedBox(width: 3),
                          Text("99"),
                          SizedBox(width: 12),
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          Text("4.5"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
            Text("ຊື່ຜູ້ຍືມ: $borrowerName", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text("ຈຳນວນມື້: $days ມື້", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text("ລາຄາລວມ: \$${totalPrice.toStringAsFixed(2)}", style: TextStyle(fontSize: 16)),

            const SizedBox(height: 24),
            Center(
              child: Image.asset(
                'assets/qr_code.jpeg',
                width: 250,
              ),
            ),

            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      title: Row(
                        children: const [
                          Icon(Icons.check_circle, color: Colors.green, size: 28),
                          SizedBox(width: 8),
                          Text("ສຳເລັດແລ້ວ"),
                        ],
                      ),
                      content: const Text("ການຊຳລະເງິນສຳເລັດແລ້ວ!"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("ຕົກລົງ"),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                ),
                child: Text("ຊຳລະເງິນ", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
