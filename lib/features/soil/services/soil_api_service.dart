import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../data/models/soil_data.dart';

/// SoilGrids had no data for the location, or the request failed.
class SoilLookupException implements Exception {}

/// Client for the free ISRIC SoilGrids v2.0 API (no API key required).
/// https://rest.isric.org/soilgrids/v2.0/docs
///
/// Responses are cached in memory (~110 m grid) and concurrent lookups for
/// the same spot are deduplicated, so repeat taps resolve instantly. Each
/// upstream request is capped by [_requestTimeout]; if one endpoint is slow
/// the other's data is still returned.
class SoilApiService {
  static const String _host = 'rest.isric.org';
  static const Duration _requestTimeout = Duration(seconds: 10);

  final http.Client _client;
  final Map<String, SoilData> _cache = {};
  final Map<String, Future<SoilData>> _inFlight = {};

  SoilApiService({http.Client? client}) : _client = client ?? http.Client();

  Future<SoilData> fetchSoilData({
    required double latitude,
    required double longitude,
  }) async {
    final key =
        '${latitude.toStringAsFixed(3)},${longitude.toStringAsFixed(3)}';
    final cached = _cache[key];
    if (cached != null) return cached;
    final pending = _inFlight[key];
    if (pending != null) return pending;

    final future = _fetchSoilData(latitude, longitude);
    _inFlight[key] = future;
    try {
      final data = await future;
      _cache[key] = data;
      return data;
    } finally {
      _inFlight.remove(key);
    }
  }

  Future<SoilData> _fetchSoilData(double latitude, double longitude) async {
    final results = await Future.wait([
      _fetchClassification(latitude, longitude),
      _fetchComposition(latitude, longitude),
    ]);
    final wrbClass = results[0] as String?;
    final composition = results[1] as Map<String, double>?;

    if (wrbClass == null && composition == null) {
      throw SoilLookupException();
    }

    return SoilData(
      latitude: latitude,
      longitude: longitude,
      wrbClass: wrbClass,
      clayPct: composition?['clay'],
      sandPct: composition?['sand'],
      siltPct: composition?['silt'],
    );
  }

  Future<String?> _fetchClassification(double lat, double lon) async {
    try {
      final uri = Uri.https(_host, '/soilgrids/v2.0/classification/query', {
        'lat': '$lat',
        'lon': '$lon',
        'number_classes': '1',
      });
      final response = await _client.get(uri).timeout(_requestTimeout);
      if (response.statusCode != 200) return null;
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final name = json['wrb_class_name'] as String?;
      return (name == null || name.isEmpty) ? null : name;
    } catch (_) {
      return null;
    }
  }

  Future<Map<String, double>?> _fetchComposition(double lat, double lon) async {
    try {
      final uri = Uri.https(_host, '/soilgrids/v2.0/properties/query', {
        'lat': '$lat',
        'lon': '$lon',
        'property': ['clay', 'sand', 'silt'],
        'depth': '0-5cm',
        'value': 'mean',
      });
      final response = await _client.get(uri).timeout(_requestTimeout);
      if (response.statusCode != 200) return null;

      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final layers =
          (json['properties'] as Map<String, dynamic>?)?['layers'] as List?;
      if (layers == null) return null;

      final composition = <String, double>{};
      for (final layer in layers.cast<Map<String, dynamic>>()) {
        final name = layer['name'] as String?;
        if (name == null) continue;
        final depths = layer['depths'] as List?;
        if (depths == null || depths.isEmpty) continue;
        final values =
            (depths.first as Map<String, dynamic>)['values']
                as Map<String, dynamic>?;
        final mean = (values?['mean'] as num?)?.toDouble();
        if (mean == null) continue;
        // Values come in mapped units (g/kg); d_factor converts to g/100g (%).
        final dFactor = ((layer['unit_measure']
                    as Map<String, dynamic>?)?['d_factor'] as num?)
                ?.toDouble() ??
            10;
        composition[name] = mean / dFactor;
      }

      const required = ['clay', 'sand', 'silt'];
      if (!required.every(composition.containsKey)) return null;
      return composition;
    } catch (_) {
      return null;
    }
  }
}
