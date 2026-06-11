import 'package:cloud_firestore/cloud_firestore.dart';

enum PlantStatus { planted, found }

/// A dorodango planted somewhere public, waiting to be found.
class PlantModel {
  final String id;
  final String ownerUid;
  final String? buildId;
  final String? hint;
  final double latitude;
  final double longitude;
  final String geohash;
  final DateTime plantedAt;
  final PlantStatus status;
  final String? foundBy;
  final DateTime? foundAt;

  const PlantModel({
    required this.id,
    required this.ownerUid,
    required this.latitude,
    required this.longitude,
    required this.geohash,
    required this.plantedAt,
    required this.status,
    this.buildId,
    this.hint,
    this.foundBy,
    this.foundAt,
  });

  factory PlantModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return PlantModel(
      id: doc.id,
      ownerUid: data['ownerUid'] as String,
      buildId: data['buildId'] as String?,
      hint: data['hint'] as String?,
      latitude: (data['latitude'] as num).toDouble(),
      longitude: (data['longitude'] as num).toDouble(),
      geohash: data['geohash'] as String,
      plantedAt: (data['plantedAt'] as Timestamp).toDate(),
      status: PlantStatus.values.firstWhere(
        (e) => e.name == data['status'],
        orElse: () => PlantStatus.planted,
      ),
      foundBy: data['foundBy'] as String?,
      foundAt: data['foundAt'] != null
          ? (data['foundAt'] as Timestamp).toDate()
          : null,
    );
  }

  Map<String, dynamic> toFirestore() => {
        'ownerUid': ownerUid,
        if (buildId != null) 'buildId': buildId,
        if (hint != null) 'hint': hint,
        'latitude': latitude,
        'longitude': longitude,
        'geohash': geohash,
        'plantedAt': Timestamp.fromDate(plantedAt),
        'status': status.name,
      };
}
