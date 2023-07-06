import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<UserCredential?> signInAnonymously() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInAnonymously();
      return userCredential;
    } catch (e) {
      // Handle any errors that occur during the authentication process
      print('Error signing in anonymously: $e');
      return null;
    }
  }
}