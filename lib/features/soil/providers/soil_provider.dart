import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/soil_data.dart';
import '../services/location_service.dart';
import '../services/soil_api_service.dart';

final locationServiceProvider = Provider((ref) => LocationService());
final soilApiServiceProvider = Provider((ref) => SoilApiService());

/// `null` means detection hasn't been requested yet.
class SoilNotifier extends StateNotifier<AsyncValue<SoilData>?> {
  final LocationService _locationService;
  final SoilApiService _apiService;

  SoilNotifier(this._locationService, this._apiService) : super(null);

  Future<void> detect() async {
    state = const AsyncValue.loading();
    try {
      final position = await _locationService.getCurrentPosition();
      await _lookup(position.latitude, position.longitude);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Looks up soil data for an explicit point (e.g. a map tap).
  Future<void> lookup(double latitude, double longitude) async {
    state = const AsyncValue.loading();
    try {
      await _lookup(latitude, longitude);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> _lookup(double latitude, double longitude) async {
    final data = await _apiService.fetchSoilData(
      latitude: latitude,
      longitude: longitude,
    );
    state = AsyncValue.data(data);
  }

  void reset() {
    state = null;
  }
}

final soilProvider =
    StateNotifierProvider<SoilNotifier, AsyncValue<SoilData>?>((ref) {
  return SoilNotifier(
    ref.watch(locationServiceProvider),
    ref.watch(soilApiServiceProvider),
  );
});

/// Separate instance for the soil map, so tapping around the map doesn't
/// clobber the soil detected on the home screen.
final mapSoilProvider = StateNotifierProvider.autoDispose<SoilNotifier,
    AsyncValue<SoilData>?>((ref) {
  return SoilNotifier(
    ref.watch(locationServiceProvider),
    ref.watch(soilApiServiceProvider),
  );
});
