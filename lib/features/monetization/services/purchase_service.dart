import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

/// Store product ids -> credits. Must match functions/src/revenuecatWebhook.ts
/// and the products configured in App Store Connect / Play Console.
const Map<String, int> kCreditProducts = {
  'credits_25': 25,
  'credits_100': 100,
  'credits_300': 300,
};

/// Thin wrapper around RevenueCat. API keys come from --dart-define so debug
/// builds without keys degrade to a visible "store unavailable" state
/// instead of crashing.
class PurchaseService {
  static const _androidKey =
      String.fromEnvironment('REVENUECAT_ANDROID_API_KEY');
  static const _iosKey = String.fromEnvironment('REVENUECAT_IOS_API_KEY');

  bool _configured = false;

  String get _platformKey {
    if (kIsWeb) return '';
    if (Platform.isAndroid) return _androidKey;
    if (Platform.isIOS) return _iosKey;
    return '';
  }

  bool get isAvailable => _platformKey.isNotEmpty;

  /// Configures RevenueCat with the Firebase uid as the app user id, so the
  /// webhook can credit the right user document.
  Future<void> init(String uid) async {
    if (!isAvailable || _configured) return;
    await Purchases.configure(
      PurchasesConfiguration(_platformKey)..appUserID = uid,
    );
    _configured = true;
  }

  Future<List<Package>> getCreditPackages() async {
    if (!_configured) return const [];
    final offerings = await Purchases.getOfferings();
    final packages = offerings.current?.availablePackages ?? const [];
    // Only show packages we know how to grant, smallest first.
    final known = packages
        .where((p) =>
            kCreditProducts.containsKey(_productKey(p.storeProduct.identifier)))
        .toList()
      ..sort((a, b) => _credits(a).compareTo(_credits(b)));
    return known;
  }

  Future<bool> purchase(Package package) async {
    try {
      await Purchases.purchasePackage(package);
      return true;
    } on Exception catch (e) {
      debugPrint('[Purchases] purchase failed: $e');
      return false;
    }
  }

  Future<void> restore() async {
    if (!_configured) return;
    await Purchases.restorePurchases();
  }

  static String _productKey(String storeIdentifier) {
    // iOS identifiers can be plain; Android can be "credits_100:base-plan".
    return storeIdentifier.split(':').first;
  }

  static int _credits(Package p) =>
      kCreditProducts[_productKey(p.storeProduct.identifier)] ?? 0;

  static int creditsFor(Package p) => _credits(p);
}
