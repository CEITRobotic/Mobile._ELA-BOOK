import '../entities/user.dart';
import '../repositories/auth_repository.dart';
import '../../domain/enums/auth_status.dart';

class RegisterUser {
  final AuthRepository repository;

  RegisterUser(this.repository);

  Future<AuthStatus> call(User user) async {
    return await repository.register(user);
  }
}
