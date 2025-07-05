import 'package:flutter/material.dart';

class SecondPageIntro extends StatelessWidget {
  const SecondPageIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF970C0C),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(image: AssetImage('assets/utils/eye.gif'), width: 250, height: 250),
            ],
          ),

          const SizedBox(height: 40),
          Transform.translate(
            offset: Offset(0, MediaQuery.of(context).size.height * 0.1),
            child: Column(
              children: [
                const Text(
                  'ປະຈົນໄພໂລກແຫ່ງຈິນຕະນາການ',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'ມິຕິຂອງການອ່ານ\nໄປກັບພວກເຮົາ ອີ່ຫລ້າບຸ໊ກ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 10),
               
                const SizedBox(height: 40), 
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 105,
                      vertical: 28,
                    ),
                  ),
                  child: const Text(
                    'ກ້າວເຂົ້າສູ່ໂລກນິຍາຍ',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 👀 Eye Widget
class Eye extends StatelessWidget {
  const Eye({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
