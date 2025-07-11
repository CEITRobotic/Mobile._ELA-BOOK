import '../repositories/auth_repository.dart';
import '../../domain/enums/auth_status.dart';

class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  Future<AuthStatus> call(String? email, String? password) async =>
      await repository.login(email, password);
}
