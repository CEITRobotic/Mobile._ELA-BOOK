import '../../domain/enums/auth_status.dart';

abstract class AuthRepository {
  Future<AuthStatus> login(String? name, String? password);
  Future<AuthStatus> register(String? name, String? password, String? email);
}
