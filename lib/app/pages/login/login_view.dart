import 'package:flutter/material.dart';
import 'login_controller.dart';
import 'package:ela_book/app/pages/register/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = LoginController();
  bool isRegister = false;
  bool _isLoading = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    setState(() {
      _isLoading = true;
    });

    final result = await controller.login();

    if (result == 'Login successful') {
      controller.emailController.clear();
      controller.passwordController.clear();

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(result)));

      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(result)));
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F4F6),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 110),
            const Center(
              child: Text(
                'ລົງທະບຽນ',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB0102A),
                ),
              ),
            ),
            const SizedBox(height: 80),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isRegister = false;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'ເຂົ້າສູ່ລະບົບ',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: isRegister ? Colors.black54 : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        if (!isRegister)
                          Container(
                            width: 90,
                            height: 2,
                            color: const Color(0xFFB0102A),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 40),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isRegister = true;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'ສະມັກເຂົ້າໃຊ້ງານ',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: isRegister ? Colors.black : Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 4),
                        if (isRegister)
                          Container(
                            width: 120,
                            height: 2,
                            color: const Color(0xFFB0102A),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: IndexedStack(
                index: isRegister ? 1 : 0,
                children: [buildLoginForm(context), const RegisterView()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLoginForm(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'ອີເມວຜູ້ໃຊ້',
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
                labelText: 'ອີເມວຜູ້ໃຊ້ງານ',
                hintText: 'ກະລຸນາປ້ອນອີເມວຜູ້ໃຊ້ງານ',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFB0102A), width: 2),
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
                  borderSide: BorderSide(color: Color(0xFFB0102A), width: 2),
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
          offset: const Offset(0, 50),
          child: SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: _isLoading ? null : _handleLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB0102A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
              ),
              child:
                  _isLoading
                      ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                      : const Text(
                        'ເຂົ້າສູ່ລະບົບ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
            ),
          ),
        ),
      ],
    );
  }
}