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
      final data = await _apiService.fetchSoilData(
        latitude: position.latitude,
        longitude: position.longitude,
      );
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final soilProvider =
    StateNotifierProvider<SoilNotifier, AsyncValue<SoilData>?>((ref) {
  return SoilNotifier(
    ref.watch(locationServiceProvider),
    ref.watch(soilApiServiceProvider),
  );
});
