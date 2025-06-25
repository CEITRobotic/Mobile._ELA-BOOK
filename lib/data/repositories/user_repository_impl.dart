import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final users = FirebaseFirestore.instance.collection('users');

  @override
  Future<void> addUser(User user) async {
    final model = UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
    );
    await users.doc(user.id).set(model.toMap());
  }
}
