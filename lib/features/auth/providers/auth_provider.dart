import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../../data/services/firestore_service.dart';
import '../../../data/models/user_model.dart';
import '../../guided_build/providers/credits_provider.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

final firestoreServiceProvider = Provider<FirestoreService>((ref) {
  return FirestoreService();
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges();
});

/// Seeds the user document with the signup bonus when missing. Idempotent;
/// the onUserCreated function and the self-healing getCredits callable do
/// the same server-side, so a rules denial here is not fatal.
Future<void> _ensureUserDoc(
    FirestoreService firestore, String uid, String? email) async {
  try {
    final existing = await firestore.getUser(uid);
    if (existing == null) {
      await firestore.createUser(UserModel(
        uid: uid,
        credits: 10,
        createdAt: DateTime.now(),
        email: email,
      ));
    }
  } catch (_) {
    // Server-side seeding covers this.
  }
}

/// The signed-in user, with their Firestore document guaranteed to exist.
/// Reactive to auth changes: re-runs after every login/logout, so data
/// providers that watch it switch accounts correctly.
final ensureAuthProvider = FutureProvider<User>((ref) async {
  final user = ref.watch(authStateProvider).valueOrNull;
  if (user == null) {
    throw StateError('Not signed in');
  }
  await _ensureUserDoc(
      ref.read(firestoreServiceProvider), user.uid, user.email);
  // Eagerly fetch credits so they're available on the home screen.
  ref.read(creditsProvider.notifier).fetch();
  return user;
});

enum AuthError { invalidCredentials, emailInUse, weakPassword, generic }

class AuthFormState {
  final bool loading;
  final AuthError? error;

  const AuthFormState({this.loading = false, this.error});
}

class AuthController extends StateNotifier<AuthFormState> {
  final AuthRepository _repository;
  final FirestoreService _firestore;

  AuthController(this._repository, this._firestore)
      : super(const AuthFormState());

  Future<void> signInWithEmail(String email, String password) =>
      _run(() => _repository.signInWithEmail(email.trim(), password));

  Future<void> registerWithEmail(String email, String password) =>
      _run(() => _repository.registerWithEmail(email.trim(), password));

  Future<void> continueAsGuest() =>
      _run(() => _repository.signInAnonymously());

  Future<void> _run(Future<UserCredential> Function() signIn) async {
    state = const AuthFormState(loading: true);
    try {
      final credential = await signIn();
      final user = credential.user;
      if (user != null) {
        await _ensureUserDoc(_firestore, user.uid, user.email);
      }
      if (mounted) state = const AuthFormState();
      // The auth state stream triggers the router redirect to /home.
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      state = AuthFormState(error: _mapError(e.code));
    } catch (_) {
      if (!mounted) return;
      state = const AuthFormState(error: AuthError.generic);
    }
  }

  static AuthError _mapError(String code) => switch (code) {
        'invalid-email' ||
        'user-not-found' ||
        'wrong-password' ||
        'user-disabled' ||
        'invalid-credential' =>
          AuthError.invalidCredentials,
        'email-already-in-use' => AuthError.emailInUse,
        'weak-password' => AuthError.weakPassword,
        _ => AuthError.generic,
      };
}

final authControllerProvider =
    StateNotifierProvider.autoDispose<AuthController, AuthFormState>((ref) {
  return AuthController(
    ref.watch(authRepositoryProvider),
    ref.watch(firestoreServiceProvider),
  );
});
