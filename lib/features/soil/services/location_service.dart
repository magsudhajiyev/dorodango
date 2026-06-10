import 'package:geolocator/geolocator.dart';

/// Location permission was denied, or location services are disabled.
class LocationPermissionException implements Exception {}

class LocationService {
  Future<Position> getCurrentPosition() async {
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

    // SoilGrids resolution is ~250 m, so low accuracy is plenty.
    return Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.low,
      ),
    );
  }
}
