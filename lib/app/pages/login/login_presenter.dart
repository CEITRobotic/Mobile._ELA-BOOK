import 'package:firebase_auth/firebase_auth.dart';

class LoginPresenter {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return 'Login successful';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided.';
      } else {
        return 'Login failed: ${e.message}';
      }
    } catch (e) {
      return 'Unexpected error: $e';
    }
  }
}
