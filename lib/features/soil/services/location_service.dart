import 'dart:async';

import 'package:geolocator/geolocator.dart';

/// Location permission was denied, or location services are disabled.
class LocationPermissionException implements Exception {}

class LocationService {
  /// Returns a position as fast as possible.
  ///
  /// By default this prefers the device's last known position (instant) —
  /// plenty accurate for soil lookups (~250 m resolution) and map centering.
  /// Pass [fresh] for flows that need the user's actual current spot
  /// (claiming a hunt find), which requests a new high-accuracy fix but is
  /// still capped by a time limit.
  Future<Position> getCurrentPosition({bool fresh = false}) async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationPermissionException();
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      throw LocationPermissionException();
    }

    if (!fresh) {
      try {
        final last = await Geolocator.getLastKnownPosition();
        if (last != null) return last;
      } catch (_) {
        // Fall through to a fresh fix.
      }
    }

    try {
      return await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(
          accuracy: fresh ? LocationAccuracy.high : LocationAccuracy.low,
          timeLimit: const Duration(seconds: 10),
        ),
      );
    } on TimeoutException {
      // Never hang the UI on a slow GPS fix — fall back to whatever we have.
      final last = await Geolocator.getLastKnownPosition();
      if (last != null) return last;
      rethrow;
    }
  }
}
