import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:dorodango/data/models/soil_data.dart';
import 'package:dorodango/features/soil/services/soil_api_service.dart';

http.Response _json(Map<String, dynamic> body) =>
    http.Response(jsonEncode(body), 200);

Map<String, dynamic> _classificationBody(String name) => {
      'wrb_class_name': name,
      'wrb_class_probability': [
        [name, 40],
      ],
    };

Map<String, dynamic> _propertiesBody({
  num? clay,
  num? sand,
  num? silt,
  num dFactor = 10,
}) =>
    {
      'properties': {
        'layers': [
          for (final entry in {'clay': clay, 'sand': sand, 'silt': silt}.entries)
            {
              'name': entry.key,
              'unit_measure': {'d_factor': dFactor, 'mapped_units': 'g/kg'},
              'depths': [
                {
                  'label': '0-5cm',
                  'values': {'mean': entry.value},
                },
              ],
            },
        ],
      },
    };

SoilApiService _service({
  Map<String, dynamic>? classification,
  Map<String, dynamic>? properties,
}) {
  return SoilApiService(
    client: MockClient((request) async {
      if (request.url.path.contains('classification')) {
        return classification != null
            ? _json(classification)
            : http.Response('error', 500);
      }
      if (request.url.path.contains('properties')) {
        return properties != null
            ? _json(properties)
            : http.Response('error', 500);
      }
      return http.Response('not found', 404);
    }),
  );
}

void main() {
  group('SoilApiService', () {
    test('parses classification and composition', () async {
      final service = _service(
        classification: _classificationBody('Cambisols'),
        properties: _propertiesBody(clay: 232, sand: 451, silt: 317),
      );

      final data = await service.fetchSoilData(latitude: 52.0, longitude: 5.0);

      expect(data.wrbClass, 'Cambisols');
      expect(data.clayPct, closeTo(23.2, 0.001));
      expect(data.sandPct, closeTo(45.1, 0.001));
      expect(data.siltPct, closeTo(31.7, 0.001));
      expect(data.hasComposition, isTrue);
    });

    test('returns classification even when composition is missing', () async {
      final service = _service(
        classification: _classificationBody('Luvisols'),
        properties: _propertiesBody(clay: null, sand: null, silt: null),
      );

      final data = await service.fetchSoilData(latitude: 0, longitude: 0);

      expect(data.wrbClass, 'Luvisols');
      expect(data.hasComposition, isFalse);
      expect(data.suitability, isNull);
    });

    test('caches results and deduplicates concurrent lookups', () async {
      var requestCount = 0;
      final service = SoilApiService(
        client: MockClient((request) async {
          requestCount++;
          if (request.url.path.contains('classification')) {
            return _json(_classificationBody('Cambisols'));
          }
          return _json(_propertiesBody(clay: 232, sand: 451, silt: 317));
        }),
      );

      // Two concurrent lookups for the same spot share one fetch.
      final results = await Future.wait([
        service.fetchSoilData(latitude: 52.0, longitude: 5.0),
        service.fetchSoilData(latitude: 52.0, longitude: 5.0),
      ]);
      expect(results[0].wrbClass, 'Cambisols');
      expect(requestCount, 2); // one classification + one properties call

      // A later lookup nearby (same ~110 m cell) hits the cache.
      final again =
          await service.fetchSoilData(latitude: 52.0001, longitude: 5.0001);
      expect(again.wrbClass, 'Cambisols');
      expect(requestCount, 2);
    });

    test('throws SoilLookupException when both lookups fail', () async {
      final service = _service();

      expect(
        () => service.fetchSoilData(latitude: 0, longitude: 0),
        throwsA(isA<SoilLookupException>()),
      );
    });
  });

  group('SoilData.suitability', () {
    SoilData withClay(double clayPct) => SoilData(
          latitude: 0,
          longitude: 0,
          clayPct: clayPct,
          sandPct: 50,
          siltPct: 50 - clayPct,
        );

    test('clay-rich soil is good', () {
      expect(withClay(25).suitability, SoilSuitability.good);
      expect(withClay(40).suitability, SoilSuitability.good);
    });

    test('moderate clay is okay', () {
      expect(withClay(12).suitability, SoilSuitability.okay);
      expect(withClay(24.9).suitability, SoilSuitability.okay);
    });

    test('low clay is sandy', () {
      expect(withClay(0).suitability, SoilSuitability.sandy);
      expect(withClay(11.9).suitability, SoilSuitability.sandy);
    });
  });
}
