import 'package:flutter/material.dart';
import 'register_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final controller = RegisterController();
  bool _isLoading = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _onRegisterPressed() async {
    setState(() {
      _isLoading = true;
    });

    final result = await controller.register();

    setState(() {
      _isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));

    if (result == 'Register successful') {
      // สมัครสำเร็จ -> ล้างข้อมูลฟอร์ม
      controller.usernameController.clear();
      controller.emailController.clear();
      controller.passwordController.clear();

      // ไปหน้า login
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'ຊື່ຜູ້ໃຊ້',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: SizedBox(
                height: 60,
                child: TextField(
                  controller: controller.usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300],
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 25,
                    ),
                    labelText: 'ຊື່ຜູ້ໃຊ້',
                    hintText: 'ກະລຸນາປ້ອນຊື່ຜຼ້ໃຊງານ',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color(0xFFB0102A),
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'ອີເມລ',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),

              child: SizedBox(
                height: 60,
                child: TextField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300],
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 25,
                    ),
                    labelText: 'ອີເມວ',
                    hintText: 'ກະລຸນາປ້ອນຊື່ອີເມວ',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color(0xFFB0102A),
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'ລະຫັດຜ່ານ',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: SizedBox(
                height: 60,
                child: TextField(
                  controller: controller.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300],
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 25,
                    ),
                    labelText: 'ລະຫັດຜ່ານ',
                    hintText: 'ກະລຸນາປ້ອນລະຫັດຜ່ານ',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color(0xFFB0102A),
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
            Transform.translate(
              offset: const Offset(0, 10),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _onRegisterPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB0102A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                  ),
                  child:
                      _isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'ສະມັກເຂົ້າໃຊ້ງານ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
