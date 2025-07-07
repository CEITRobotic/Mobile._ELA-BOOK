import 'dart:async';
import 'package:ela_book/data/models/rent_model.dart';
import 'package:ela_book/barrel/novel.dart';
import 'package:flutter/material.dart';

class PurchaseSummaryPage extends StatefulWidget {
  final RentModel rentModel;
  final int quantity;
  final double pricePerBook;

  const PurchaseSummaryPage({
    Key? key,
    required this.quantity,
    required this.pricePerBook,
    RentModel? rentModel,
  }) : rentModel = rentModel ?? const RentModel(),
       super(key: key);

  @override
  State<PurchaseSummaryPage> createState() => _PurchaseSummaryPageState();
}

class _PurchaseSummaryPageState extends State<PurchaseSummaryPage> {
  late Timer _timer;
  Duration _remainingTime = const Duration(minutes: 30);
  bool _isPaid = false;

  @override
  void initState() {
    super.initState();
    _startCountdownTimer();
  }

  void _startCountdownTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime.inSeconds > 0) {
        setState(() {
          _remainingTime -= const Duration(seconds: 1);
        });
      } else {
        timer.cancel();
        if (!_isPaid && mounted) {
          Navigator.popUntil(context, (route) => route.isFirst);
        }
      }
    });
  }

  void _showPaymentSuccessDialog() async {
    await BuyNovel(NovelRepositoryImpl())(widget.rentModel.id);

    if (_isPaid) return;

    setState(() {
      _isPaid = true;
    });

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('ຊຳລະເງິນສຳເລັດແລ້ວ'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.check_circle, size: 50, color: Colors.green),
                SizedBox(height: 12),
                Text('ເຈົ້າໄດ້ຊຳລະເງິນລຽບລ້ອຍແລ້ວ'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('ຕົກລົງ'),
              ),
            ],
          ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final rentModel = widget.rentModel;
    final total = widget.quantity * widget.pricePerBook;

    return Scaffold(
      appBar: AppBar(title: const Text('ສະຫຼຸບຍອດຊື້'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            if (!_isPaid)
              Center(
                child: Text(
                  'ກະລຸນາຊຳລະເງີນພາຍໃນ: ${_formatDuration(_remainingTime)} ນາທີ',
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),

            const SizedBox(height: 16),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    rentModel.image,
                    width: 100,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        rentModel.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text('ຜູ້ແຕ່ງ: ${rentModel.author}'),
                      SizedBox(height: 4),
                      Text('ເຂົ້າຊົມ: ${rentModel.views} ຄັ້ງ'),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Icon(Icons.star_half, color: Colors.amber, size: 16),
                          SizedBox(width: 6),
                          Text(
                            '${rentModel.rating}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('ຈຳນວນຫົວທັ້ງໝົດ', style: TextStyle(fontSize: 16)),
                Text(
                  '${widget.quantity} ຫົວ',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('ລາຄາຕໍ່ຫົວ', style: TextStyle(fontSize: 16)),
                Text(
                  '${widget.pricePerBook.toStringAsFixed(1)} ກີບ',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const Divider(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'ຍອດລວມທັ້ງໝົດ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${total.toStringAsFixed(1)} ກີບ',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            const Center(
              child: Text(
                'ຊຳລະຜ່ານ QR Code',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),

            Center(
              child: Image.asset(
                'assets/qr_code.jpeg',
                width: 400,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                onPressed: _showPaymentSuccessDialog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 14,
                  ),
                ),
                child: const Text(
                  'ຊຳລະເງີນ',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
