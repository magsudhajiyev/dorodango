import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth;

  AuthRepository({FirebaseAuth? auth})
      : _auth = auth ?? FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> authStateChanges() => _auth.authStateChanges();

  Future<UserCredential> signInAnonymously() => _auth.signInAnonymously();

  Future<void> signOut() => _auth.signOut();
}
