import '../entities/user.dart';
import '../repositories/auth_repository.dart';
import '../../domain/enums/auth_status.dart';

class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  Future<AuthStatus> call(User user) async {
    return await repository.login(user);
  }
}
