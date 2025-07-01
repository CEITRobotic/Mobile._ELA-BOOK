import 'package:flutter/material.dart';
import '../models/rent_model.dart';
import '../pages/rent_summary_page.dart';
import '../widgets/success_dialog.dart';

class RentPage extends StatefulWidget {
  final RentModel rentModel;

  const RentPage({Key? key, required this.rentModel}) : super(key: key);

  @override
  State<RentPage> createState() => _RentPageState();
}

class _RentPageState extends State<RentPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController borrowDateController = TextEditingController();
  final TextEditingController returnDateController = TextEditingController();

  DateTime? borrowDate;
  DateTime? returnDate;
  String queueStatus = "";

  @override
  Widget build(BuildContext context) {
    final rentModel = widget.rentModel;

    return Scaffold(
      appBar: AppBar(title: Text("ເຊົ່າໜັງສື")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Book details
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    children: [
                      Text(
                        rentModel.title,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text("ຜູ້ຂຽນ: ${rentModel.author}"),
                      const SizedBox(height: 4),
                      const Text("ເຂົ້າເບິ່ງ: 1234 ຄັ້ງ"),
                      const SizedBox(height: 4),
                      const Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.red, size: 20),
                          SizedBox(width: 3),
                          Text("99"),
                          SizedBox(width: 12),
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          Text("4.5"),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "ລາຄາເຊົ່າຕໍ່ວັນ: ${rentModel.pricePerDay.toStringAsFixed(2)} ກີບ",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Name input
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "ຊື່ຜູ້ຍືມ",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            // Borrow date
            TextField(
              controller: borrowDateController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: "ວັນທີ່ຢືມ",
                suffixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
              ),
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: borrowDate ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() {
                    borrowDate = picked;
                    borrowDateController.text = "${picked.toLocal()}".split(' ')[0];
                    _updateQueueStatus();
                  });
                }
              },
            ),

            const SizedBox(height: 16),

            // Return date
            TextField(
              controller: returnDateController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: "ວັນທີ່ສົ່ງຄືນ",
                suffixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
              ),
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: returnDate ?? DateTime.now().add(Duration(days: 1)),
                  firstDate: borrowDate ?? DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() {
                    returnDate = picked;
                    returnDateController.text = "${picked.toLocal()}".split(' ')[0];
                    _updateQueueStatus();
                  });
                }
              },
            ),

            const SizedBox(height: 16),

            // Queue status message
            if (queueStatus.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.yellow[100],
                  border: Border.all(color: Colors.orange),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  queueStatus,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),

            const SizedBox(height: 20),

            // Confirm button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  if (nameController.text.isEmpty || borrowDate == null || returnDate == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("ກະລຸນາກຮອກຂໍ້ມູນໃຫ້ຄົບ")),
                    );
                    return;
                  }

                  final days = returnDate!.difference(borrowDate!).inDays;
                  final totalPrice = days * rentModel.pricePerDay;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => RentSummaryPage(
                        rentModel: rentModel,
                        borrowerName: nameController.text,
                        borrowDate: borrowDate!,
                        returnDate: returnDate!,
                        totalPrice: totalPrice,
                      ),
                    ),
                  );
                },
                child: Text("ຢືນຢັນການເຊົ່າ"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateQueueStatus() {
    final rentModel = widget.rentModel;

    if (borrowDate != null && returnDate != null) {
      if (rentModel.queueCount > 0 && rentModel.availableDate != null) {
        final now = DateTime.now();
        final waitDays = rentModel.availableDate!.difference(now).inDays;

        if (waitDays <= 0) {
          queueStatus = "ພ້ອມໃຫ້ຢືມແລ້ວ";
        } else {
          queueStatus = "ຕ້ອງລໍຖ້າຄິວ $waitDays ມື້";
        }
      } else {
        queueStatus = "ພ້ອມໃຫ້ຢືມແລ້ວ";
      }
    } else {
      queueStatus = "";
    }
  }
}
