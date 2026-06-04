import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../../data/services/firestore_service.dart';
import '../../../data/models/user_model.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

final firestoreServiceProvider = Provider<FirestoreService>((ref) {
  return FirestoreService();
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges();
});

final ensureAuthProvider = FutureProvider<User>((ref) async {
  final authRepo = ref.read(authRepositoryProvider);
  var user = authRepo.currentUser;

  if (user == null) {
    try {
      final credential = await authRepo.signInAnonymously();
      user = credential.user!;
    } on FirebaseAuthException catch (e) {
      throw Exception(
        'Auth failed: code=${e.code}, message=${e.message}, '
        'plugin=${e.plugin}',
      );
    }

    final firestore = ref.read(firestoreServiceProvider);
    final existing = await firestore.getUser(user.uid);
    if (existing == null) {
      await firestore.createUser(UserModel(
        uid: user.uid,
        credits: 10,
        createdAt: DateTime.now(),
      ));
    }
  }

  return user;
});
