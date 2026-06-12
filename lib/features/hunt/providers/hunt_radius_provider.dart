import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/providers/locale_provider.dart';

const _kHuntRadiusKey = 'hunt_radius_km';

/// Choices kept within what one geohash cell ring can guarantee
/// (precision-4 cells cover ~19.5 km in the worst direction).
const List<int> huntRadiusOptionsKm = [5, 10, 15];
const int defaultHuntRadiusKm = 10;

class HuntRadiusNotifier extends StateNotifier<int> {
  final SharedPreferences _prefs;

  HuntRadiusNotifier(this._prefs) : super(defaultHuntRadiusKm) {
    final saved = _prefs.getInt(_kHuntRadiusKey);
    if (saved != null && huntRadiusOptionsKm.contains(saved)) {
      state = saved;
    }
  }

  void setRadius(int km) {
    if (!huntRadiusOptionsKm.contains(km)) return;
    state = km;
    _prefs.setInt(_kHuntRadiusKey, km);
  }
}

/// The hunt map search radius in kilometers, persisted across sessions.
final huntRadiusProvider =
    StateNotifierProvider<HuntRadiusNotifier, int>((ref) {
  return HuntRadiusNotifier(ref.watch(sharedPreferencesProvider));
});
