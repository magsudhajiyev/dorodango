import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/providers/auth_provider.dart';
import '../../voice/services/ai_chat_service.dart';

final aiChatServiceProvider = Provider((ref) => AiChatService());

/// Live credit balance, read straight from the user's own Firestore
/// document (owner reads are allowed by the rules). This deliberately does
/// NOT go through the getCredits callable: the balance must stay visible
/// even when Cloud Run rejects function invocations, and a realtime
/// listener also picks up server-side deductions and purchase grants
/// the moment they land.
class CreditsNotifier extends StateNotifier<int> {
  final FirebaseFirestore _db;
  final String? _uid;
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? _subscription;

  CreditsNotifier({String? uid, FirebaseFirestore? firestore})
      : _db = firestore ?? FirebaseFirestore.instance,
        _uid = uid,
        super(0) {
    final id = _uid;
    if (id == null) return;
    _subscription = _db.collection('users').doc(id).snapshots().listen(
      (doc) {
        final credits = (doc.data()?['credits'] as num?)?.toInt();
        if (credits != null) state = credits;
      },
      onError: (_) {
        // Keep the last known value.
      },
    );
  }

  /// One-shot refresh (used e.g. while polling for a purchase grant).
  /// The realtime listener usually makes this redundant.
  Future<void> fetch() async {
    final id = _uid;
    if (id == null) return;
    try {
      final doc = await _db.collection('users').doc(id).get();
      final credits = (doc.data()?['credits'] as num?)?.toInt();
      if (credits != null) state = credits;
    } catch (_) {
      // Keep current value on failure
    }
  }

  void set(int credits) {
    state = credits;
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}

final creditsProvider = StateNotifierProvider<CreditsNotifier, int>((ref) {
  // Rebuilds on login/logout so the listener always tracks the right user.
  final uid = ref.watch(authStateProvider).valueOrNull?.uid;
  return CreditsNotifier(uid: uid);
});

final hasCreditsProvider = Provider<bool>((ref) {
  return ref.watch(creditsProvider) > 0;
});
