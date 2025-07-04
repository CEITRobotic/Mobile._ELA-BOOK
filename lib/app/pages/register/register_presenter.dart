import 'package:ela_book/barrel/auth.dart';

class RegisterPresenter {
  Future<String> register(
    String username,
    String email,
    String password,
  ) async {
    final user = User(name: username, password: password, email: email);
    final status = await RegisterUser(AuthRepositoryImpl())(
      user.name,
      user.password,
      user.email,
    );

    switch (status) {
      case AuthStatus.success:
        return 'Register successful';
      case AuthStatus.exist:
        return 'Email already in use';
      case AuthStatus.weakPassword:
        return 'Password is too weak.';
      default:
        return '[!] Unexpected error: Register failed';
    }
  }
}
