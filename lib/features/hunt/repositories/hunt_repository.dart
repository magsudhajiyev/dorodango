import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong2/latlong.dart';
import 'package:uuid/uuid.dart';

import '../../../core/utils/geohash.dart';
import '../../../data/models/plant_model.dart';

class HuntRepository {
  final FirebaseFirestore _db;

  HuntRepository({FirebaseFirestore? firestore})
      : _db = firestore ?? FirebaseFirestore.instance;

  CollectionReference get _plants => _db.collection('plants');

  Future<PlantModel> plant({
    required String ownerUid,
    required double latitude,
    required double longitude,
    String? buildId,
    String? hint,
  }) async {
    final model = PlantModel(
      id: const Uuid().v4(),
      ownerUid: ownerUid,
      buildId: buildId,
      hint: (hint == null || hint.trim().isEmpty) ? null : hint.trim(),
      latitude: latitude,
      longitude: longitude,
      geohash: geohashEncode(latitude, longitude),
      plantedAt: DateTime.now(),
      status: PlantStatus.planted,
    );
    await _plants.doc(model.id).set(model.toFirestore());
    return model;
  }

  /// All still-planted dorodangos within [radiusKm] of the given point.
  /// The geohash cell precision adapts to the radius: ~4.9 km cells for
  /// tight searches, ~19.5 km cells for wide ones — the cell plus its
  /// neighbors always covers the requested radius.
  Future<List<PlantModel>> nearbyPlants({
    required double latitude,
    required double longitude,
    double radiusKm = 10,
  }) async {
    final precision = radiusKm <= 4 ? 5 : 4;
    final center =
        geohashEncode(latitude, longitude, precision: precision);
    final cells = geohashCoverage(center);

    final snapshots = await Future.wait(cells.map(
      (cell) => _plants
          .where('status', isEqualTo: PlantStatus.planted.name)
          .where('geohash', isGreaterThanOrEqualTo: cell)
          .where('geohash', isLessThan: '$cell~')
          .get(),
    ));

    const distance = Distance();
    final origin = LatLng(latitude, longitude);
    final seen = <String>{};
    final result = <PlantModel>[];
    for (final snapshot in snapshots) {
      for (final doc in snapshot.docs) {
        if (!seen.add(doc.id)) continue;
        final plant = PlantModel.fromFirestore(doc);
        final km = distance.as(
          LengthUnit.Kilometer,
          origin,
          LatLng(plant.latitude, plant.longitude),
        );
        if (km <= radiusKm) result.add(plant);
      }
    }
    result.sort((a, b) => a.plantedAt.compareTo(b.plantedAt));
    return result;
  }

  Future<void> markFound({
    required String plantId,
    required String foundBy,
  }) {
    return _plants.doc(plantId).update({
      'status': PlantStatus.found.name,
      'foundBy': foundBy,
      'foundAt': Timestamp.fromDate(DateTime.now()),
    });
  }

  /// Cheap aggregate counts for the profile screen.
  Future<int> plantedCountBy(String uid) async {
    final agg =
        await _plants.where('ownerUid', isEqualTo: uid).count().get();
    return agg.count ?? 0;
  }

  Future<int> foundCountBy(String uid) async {
    final agg = await _plants.where('foundBy', isEqualTo: uid).count().get();
    return agg.count ?? 0;
  }

  /// The user's trophy shelf: everything they have found, newest first.
  Future<List<PlantModel>> foundBy(String uid) async {
    final snapshot = await _plants
        .where('foundBy', isEqualTo: uid)
        .orderBy('foundAt', descending: true)
        .get();
    return snapshot.docs.map(PlantModel.fromFirestore).toList();
  }
}
