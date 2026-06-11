import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong2/latlong.dart';
import 'package:uuid/uuid.dart';

import '../../../core/utils/geohash.dart';
import '../../../data/models/plant_model.dart';

/// Precision-5 geohash cells are ~4.9 km on a side, so the cell plus its
/// neighbors covers the hunt radius below.
const int _queryPrecision = 5;
const double huntRadiusKm = 5;

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

  /// All still-planted dorodangos within [huntRadiusKm] of the given point.
  Future<List<PlantModel>> nearbyPlants({
    required double latitude,
    required double longitude,
  }) async {
    final center = geohashEncode(latitude, longitude,
        precision: _queryPrecision);
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
        if (km <= huntRadiusKm) result.add(plant);
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
}
