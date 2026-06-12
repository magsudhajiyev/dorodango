import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth;

  AuthRepository({FirebaseAuth? auth})
      : _auth = auth ?? FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> authStateChanges() => _auth.authStateChanges();

  Future<UserCredential> signInWithEmail(String email, String password) =>
      _auth.signInWithEmailAndPassword(email: email, password: password);

  Future<UserCredential> registerWithEmail(String email, String password) =>
      _auth.createUserWithEmailAndPassword(email: email, password: password);

  Future<void> signOut() => _auth.signOut();
}
