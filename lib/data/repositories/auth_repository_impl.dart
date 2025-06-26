import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/user_model.dart';
import '../../domain/enums/auth_status.dart';

class AuthRepositoryImpl implements AuthRepository {
  final users = FirebaseFirestore.instance.collection('users');

  Future<QuerySnapshot<Map<String, dynamic>>> _checkExistNameData(
    User user,
  ) async {
    return await users.where('name', isEqualTo: user.name).limit(1).get();
  }

  String _hashSHA256(String input) {
    var bytes = utf8.encode(input);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Future<AuthStatus> register(User user) async {
    final model = UserModel(
      name: user.name!,
      password: _hashSHA256(user.password!),
      email: user.email!,
    );

    final query = await _checkExistNameData(model);
    if (query.docs.isNotEmpty) return AuthStatus.exist;

    await users.add(model.toMap());
    return AuthStatus.success;
  }

  @override
  Future<AuthStatus> login(User user) async {
    final model = UserModel(
      name: user.name!,
      password: _hashSHA256(user.password!),
    );

    final query = await _checkExistNameData(model);
    if (query.docs.isEmpty) return AuthStatus.notExist;

    final data = query.docs.first.data();
    if (data['password'] == model.password) {
      return AuthStatus.success;
    } else {
      return AuthStatus.notSuccess;
    }
  }
}
