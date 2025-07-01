import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/enums/auth_status.dart';

class AuthRepositoryImpl implements AuthRepository {
  final firestore = FirebaseFirestore.instance.collection('users');

  @override
  Future<AuthStatus> register(
    String? name,
    String? password,
    String? email,
  ) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);
      await firestore.doc(userCredential.user!.uid).set({'name': name});
      return AuthStatus.success;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          return AuthStatus.exist;
        case "weak-password":
          return AuthStatus.weakPassword;
        default:
          return AuthStatus.notSuccess;
      }
    }
  }

  @override
  Future<AuthStatus> login(String? email, String? password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      return AuthStatus.success;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-credential":
          return AuthStatus.notExist;
        default:
          return AuthStatus.notSuccess;
      }
    }
  }
}
