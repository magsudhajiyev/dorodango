/// Minimal geohash implementation for proximity queries
/// (geofire-style prefix ranges on Firestore string fields).
library;

const String _base32 = '0123456789bcdefghjkmnpqrstuvwxyz';

/// Encodes a coordinate to a geohash of [precision] characters.
String geohashEncode(double latitude, double longitude, {int precision = 9}) {
  var latLo = -90.0, latHi = 90.0;
  var lonLo = -180.0, lonHi = 180.0;
  final buffer = StringBuffer();
  var isEven = true;
  var bit = 0;
  var ch = 0;

  while (buffer.length < precision) {
    if (isEven) {
      final mid = (lonLo + lonHi) / 2;
      if (longitude >= mid) {
        ch = (ch << 1) + 1;
        lonLo = mid;
      } else {
        ch = ch << 1;
        lonHi = mid;
      }
    } else {
      final mid = (latLo + latHi) / 2;
      if (latitude >= mid) {
        ch = (ch << 1) + 1;
        latLo = mid;
      } else {
        ch = ch << 1;
        latHi = mid;
      }
    }
    isEven = !isEven;
    if (++bit == 5) {
      buffer.write(_base32[ch]);
      bit = 0;
      ch = 0;
    }
  }
  return buffer.toString();
}

({double latLo, double latHi, double lonLo, double lonHi}) _bounds(
    String geohash) {
  var latLo = -90.0, latHi = 90.0;
  var lonLo = -180.0, lonHi = 180.0;
  var isEven = true;

  for (final char in geohash.split('')) {
    final cd = _base32.indexOf(char);
    assert(cd >= 0, 'Invalid geohash character: $char');
    for (var mask = 16; mask > 0; mask >>= 1) {
      if (isEven) {
        final mid = (lonLo + lonHi) / 2;
        if (cd & mask != 0) {
          lonLo = mid;
        } else {
          lonHi = mid;
        }
      } else {
        final mid = (latLo + latHi) / 2;
        if (cd & mask != 0) {
          latLo = mid;
        } else {
          latHi = mid;
        }
      }
      isEven = !isEven;
    }
  }
  return (latLo: latLo, latHi: latHi, lonLo: lonLo, lonHi: lonHi);
}

/// The cell itself plus its 8 neighbors, at the same precision.
/// Covers a radius of at least half a cell in every direction, which is
/// why callers pick the precision to match their search radius.
List<String> geohashCoverage(String geohash) {
  final b = _bounds(geohash);
  final latCenter = (b.latLo + b.latHi) / 2;
  final lonCenter = (b.lonLo + b.lonHi) / 2;
  final dLat = b.latHi - b.latLo;
  final dLon = b.lonHi - b.lonLo;

  final cells = <String>{};
  for (var dy = -1; dy <= 1; dy++) {
    for (var dx = -1; dx <= 1; dx++) {
      final lat = (latCenter + dy * dLat).clamp(-89.999999, 89.999999);
      var lon = lonCenter + dx * dLon;
      lon = ((lon + 180) % 360 + 360) % 360 - 180;
      cells.add(geohashEncode(lat, lon, precision: geohash.length));
    }
  }
  return cells.toList();
}
