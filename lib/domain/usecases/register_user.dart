import '../repositories/auth_repository.dart';
import '../../domain/enums/auth_status.dart';

class RegisterUser {
  final AuthRepository repository;

  RegisterUser(this.repository);

  Future<AuthStatus> call(
    String? name,
    String? password,
    String? email,
  ) async => await repository.register(name, password, email);
}
