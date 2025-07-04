import 'package:ela_book/barrel/auth.dart';

class LoginPresenter {
  Future<String> login(String email, String password) async {
    final user = User(email: email, password: password);
    final status = await LoginUser(AuthRepositoryImpl())(
      user.email,
      user.password,
    );

    switch (status) {
      case AuthStatus.success:
        return 'Login successful';
      case AuthStatus.notSuccess:
        return 'Wrong password or email provided .';
      case AuthStatus.notExist:
        return 'No user found for that email.';
      default:
        return '[!] Unexpected error: Login failed';
    }
  }
}
