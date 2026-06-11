import 'package:flutter_test/flutter_test.dart';
import 'package:dorodango/core/utils/geohash.dart';

void main() {
  group('geohashEncode', () {
    test('matches known reference values', () {
      // Reference values from geohash.org.
      expect(geohashEncode(57.64911, 10.40744, precision: 11), 'u4pruydqqvj');
      expect(geohashEncode(42.6, -5.6, precision: 5), 'ezs42');
      expect(geohashEncode(0, 0, precision: 9), 's00000000');
    });

    test('default precision is 9', () {
      expect(geohashEncode(48.8566, 2.3522).length, 9);
    });
  });

  group('geohashCoverage', () {
    test('returns 9 distinct cells away from edges', () {
      final cells = geohashCoverage('u4pru');
      expect(cells.length, 9);
      expect(cells.toSet().length, 9);
      expect(cells, contains('u4pru'));
      for (final cell in cells) {
        expect(cell.length, 5);
      }
    });

    test('neighbors are adjacent cells', () {
      // ezs42's known east neighbor is ezs43.
      expect(geohashCoverage('ezs42'), contains('ezs43'));
    });

    test('handles the antimeridian without throwing', () {
      final cells = geohashCoverage(geohashEncode(0, 179.99, precision: 5));
      expect(cells, isNotEmpty);
    });

    test('handles the poles without throwing', () {
      final cells = geohashCoverage(geohashEncode(89.9, 0, precision: 5));
      expect(cells, isNotEmpty);
    });
  });
}
