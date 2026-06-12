import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../auth/providers/auth_provider.dart';
import '../../guided_build/providers/credits_provider.dart';
import '../services/purchase_service.dart';

final purchaseServiceProvider = Provider((ref) => PurchaseService());

enum PaywallStatus { loading, ready, unavailable, purchasing, error }

class PaywallState {
  final PaywallStatus status;
  final List<Package> packages;

  const PaywallState({
    this.status = PaywallStatus.loading,
    this.packages = const [],
  });
}

class PaywallNotifier extends StateNotifier<PaywallState> {
  final PurchaseService _service;
  final CreditsNotifier _creditsNotifier;
  final String? _uid;

  PaywallNotifier(this._service, this._creditsNotifier, this._uid)
      : super(const PaywallState()) {
    _load();
  }

  Future<void> _load() async {
    final uid = _uid;
    if (uid == null || !_service.isAvailable) {
      state = const PaywallState(status: PaywallStatus.unavailable);
      return;
    }
    try {
      await _service.init(uid);
      final packages = await _service.getCreditPackages();
      if (!mounted) return;
      state = packages.isEmpty
          ? const PaywallState(status: PaywallStatus.unavailable)
          : PaywallState(status: PaywallStatus.ready, packages: packages);
    } catch (_) {
      if (!mounted) return;
      state = const PaywallState(status: PaywallStatus.error);
    }
  }

  /// Returns true when the purchase went through. Credits are granted
  /// server-side by the RevenueCat webhook, so poll the balance briefly
  /// until the grant lands.
  Future<bool> buy(Package package) async {
    final packages = state.packages;
    state = PaywallState(status: PaywallStatus.purchasing, packages: packages);

    final before = _creditsNotifier.state;
    final ok = await _service.purchase(package);
    if (!mounted) return ok;
    state = PaywallState(status: PaywallStatus.ready, packages: packages);
    if (!ok) return false;

    // Wait for the webhook grant (usually 1-3 s).
    for (var i = 0; i < 8; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 1500));
      await _creditsNotifier.fetch();
      if (_creditsNotifier.state > before) break;
    }
    return true;
  }

  Future<void> restore() => _service.restore();
}

final paywallProvider = StateNotifierProvider.autoDispose<PaywallNotifier,
    PaywallState>((ref) {
  return PaywallNotifier(
    ref.watch(purchaseServiceProvider),
    ref.watch(creditsProvider.notifier),
    ref.watch(authStateProvider).valueOrNull?.uid,
  );
});
