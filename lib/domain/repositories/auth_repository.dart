import '../entities/user.dart';
import '../../domain/enums/auth_status.dart';

abstract class AuthRepository {
  Future<AuthStatus> login(User user);
  Future<AuthStatus> register(User user);
}