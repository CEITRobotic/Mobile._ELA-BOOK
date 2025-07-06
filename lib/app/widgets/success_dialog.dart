import 'package:flutter/material.dart';

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext ctx) {
      return AlertDialog(
        title: Row(
          children: const [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 8),
            Text("ສຳເລັດ!"),
          ],
        ),
        content: const Text("ດຳເນີນການເຊົ່າໜັງສືສຳເລັດແລ້ວ"),
        actions: [
          TextButton(
            child: const Text("ຕົກລົງ"),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
        ],
      );
    },
  );
}
