import 'package:firebase_auth/firebase_auth.dart';

class RegisterPresenter {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> register(
    String username,
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await userCredential.user?.updateDisplayName(username);

      return 'Register successful';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'Email already in use.';
      } else if (e.code == 'weak-password') {
        return 'Password is too weak.';
      } else {
        return 'Register failed: ${e.message}';
      }
    } catch (e) {
      return 'Unexpected error: $e';
    }
  }
}
