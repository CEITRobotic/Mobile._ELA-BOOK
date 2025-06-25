import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/user_model.dart';
import '../../domain/enums/auth_status.dart';

class AuthRepositoryImpl implements AuthRepository {
  final users = FirebaseFirestore.instance.collection('users');

  Future<QuerySnapshot<Map<String, dynamic>>> _checkExistData(User user) async {
    return await users.where('name', isEqualTo: user.name).limit(1).get();
  }

  @override
  Future<AuthStatus> register(User user) async {
    final model = UserModel(
      name: user.name!,
      password: user.password!,
      email: user.email!,
    );

    final query = await _checkExistData(model);
    if (query.docs.isNotEmpty) return AuthStatus.exist;

    await users.add(model.toMap());
    return AuthStatus.success;
  }

  @override
  Future<AuthStatus> login(User user) async {
    final query = await _checkExistData(user);
    if (query.docs.isEmpty) return AuthStatus.notFound;

    final data = query.docs.first.data();
    if (data['password'] == user.password) {
      return AuthStatus.success;
    } else {
      return AuthStatus.error;
    }
  }
}
