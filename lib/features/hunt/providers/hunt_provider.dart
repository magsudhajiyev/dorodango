import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/plant_model.dart';
import '../../auth/providers/auth_provider.dart';
import '../../soil/providers/soil_provider.dart';
import '../../soil/services/location_service.dart';
import '../repositories/hunt_repository.dart';
import '../services/hunt_notification_service.dart';
import 'hunt_radius_provider.dart';

final huntRepositoryProvider = Provider((ref) => HuntRepository());
final huntNotificationServiceProvider =
    Provider((ref) => HuntNotificationService());

enum HuntStatus { idle, locating, loading, ready, locationDenied, error }

class HuntState {
  final HuntStatus status;
  final double? latitude;
  final double? longitude;
  final List<PlantModel> plants;

  const HuntState({
    this.status = HuntStatus.idle,
    this.latitude,
    this.longitude,
    this.plants = const [],
  });

  HuntState copyWith({
    HuntStatus? status,
    double? latitude,
    double? longitude,
    List<PlantModel>? plants,
  }) =>
      HuntState(
        status: status ?? this.status,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        plants: plants ?? this.plants,
      );
}

class HuntNotifier extends StateNotifier<HuntState> {
  final HuntRepository _repository;
  final LocationService _locationService;
  final HuntNotificationService _notificationService;
  final String? _uid;
  final int _radiusKm;

  HuntNotifier(
    this._repository,
    this._locationService,
    this._notificationService,
    this._uid,
    this._radiusKm,
  ) : super(const HuntState()) {
    // Auto-load so a radius change (provider rebuild) refreshes the map.
    Future.microtask(load);
  }

  Future<void> load() async {
    if (!mounted) return;
    if (state.status == HuntStatus.locating ||
        state.status == HuntStatus.loading) {
      return;
    }
    state = state.copyWith(status: HuntStatus.locating);
    final double lat;
    final double lng;
    try {
      final position = await _locationService.getCurrentPosition();
      lat = position.latitude;
      lng = position.longitude;
    } on LocationPermissionException {
      state = state.copyWith(status: HuntStatus.locationDenied);
      return;
    } catch (_) {
      state = state.copyWith(status: HuntStatus.locationDenied);
      return;
    }

    state = state.copyWith(
      status: HuntStatus.loading,
      latitude: lat,
      longitude: lng,
    );

    // Opt this device into "planted near you" pushes while we're here.
    final uid = _uid;
    if (uid != null) {
      // ignore: unawaited_futures
      _notificationService.register(uid: uid, latitude: lat, longitude: lng);
    }

    await refresh();
  }

  Future<void> refresh() async {
    final lat = state.latitude;
    final lng = state.longitude;
    if (lat == null || lng == null) return;
    try {
      final plants = await _repository.nearbyPlants(
        latitude: lat,
        longitude: lng,
        radiusKm: _radiusKm.toDouble(),
      );
      if (!mounted) return;
      state = state.copyWith(status: HuntStatus.ready, plants: plants);
    } catch (_) {
      if (!mounted) return;
      state = state.copyWith(status: HuntStatus.error);
    }
  }

  Future<void> markFound(PlantModel plant) async {
    final uid = _uid;
    if (uid == null) return;
    await _repository.markFound(plantId: plant.id, foundBy: uid);
    state = state.copyWith(
      plants: state.plants.where((p) => p.id != plant.id).toList(),
    );
  }
}

final huntProvider =
    StateNotifierProvider.autoDispose<HuntNotifier, HuntState>((ref) {
  return HuntNotifier(
    ref.watch(huntRepositoryProvider),
    ref.watch(locationServiceProvider),
    ref.watch(huntNotificationServiceProvider),
    ref.watch(authStateProvider).valueOrNull?.uid,
    // Changing the radius rebuilds the notifier, which reloads the map.
    ref.watch(huntRadiusProvider),
  );
});

/// The dorodangos this user has found, newest first.
final foundPlantsProvider =
    FutureProvider.autoDispose<List<PlantModel>>((ref) async {
  final uid = ref.watch(authStateProvider).valueOrNull?.uid;
  if (uid == null) return const [];
  return ref.watch(huntRepositoryProvider).foundBy(uid);
});
