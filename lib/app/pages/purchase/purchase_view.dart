import 'package:flutter/material.dart';
import '../../utils/purchase_summary_page.dart'; //  ()

class PurchaseView extends StatefulWidget {
  const PurchaseView({Key? key}) : super(key: key);

  @override
  State<PurchaseView> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchaseView> {
  int quantity = 1;
  final double pricePerBook = 150.000;

  void _goToSummaryPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PurchaseSummaryPage(
          quantity: quantity,
          pricePerBook: pricePerBook,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ຊື້ໜັງສື')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅  ລາຍລະອຽດ
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/Rakkhuekarnderntharng.jpg',
                      width: 100,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'ຮັກຄືການເດີນທາງ',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 6),
                        Text('ຜູ້ຂຽນ: lorem ipsum'),
                        SizedBox(height: 6),
                        Text('ໝວດ: Drama, Love, Life'),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Icon(Icons.star_half, color: Colors.amber, size: 16),
                            SizedBox(width: 6),
                            Text('4.5'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ✅
              const Text(
                'ລີວິວໜັງສື',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'ເນື່ອຫາເຂັ້ມຂົນ້ ນ່າຕິດຕາມ ອ່ານແລ້ວອິນທີ່ສຸດ\nເໝາະສຳລັບຜູ້ອ່ານທີ່ມັກແນວຮັກ ຊື້ງກິນໃຈ\nຖ່າຍທອດອາລົມໄດ້ດີຫຼາຍໆ',
              ),

              const SizedBox(height: 20),

              // ✅
              const Text(
                'ຈຳນວນຫົວທີ່ຕ້ອງການຊື້',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (quantity > 1) quantity--;
                      });
                    },
                    icon: const Icon(Icons.remove_circle_outline),
                  ),
                  Text(
                    '$quantity',
                    style: const TextStyle(fontSize: 16),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    icon: const Icon(Icons.add_circle_outline),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ✅ ລາຄາ
              const Text(
                'ລາຄາຕໍ່ຫົວ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                readOnly: true,
                initialValue: '${pricePerBook.toStringAsFixed(3)} ກີບ',
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                ),
              ),

              const SizedBox(height: 30),

              // ✅  "Button is next page"
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _goToSummaryPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'ຖັດໄປ',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
