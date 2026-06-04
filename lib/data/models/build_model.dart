import 'package:cloud_firestore/cloud_firestore.dart';

enum BuildStatus { inProgress, completed, abandoned }

class BuildModel {
  final String id;
  final DateTime startedAt;
  final BuildStatus status;
  final String? soilSource;
  final DateTime? finishedAt;

  const BuildModel({
    required this.id,
    required this.startedAt,
    required this.status,
    this.soilSource,
    this.finishedAt,
  });

  factory BuildModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return BuildModel(
      id: doc.id,
      startedAt: (data['startedAt'] as Timestamp).toDate(),
      status: BuildStatus.values.firstWhere(
        (e) => e.name == data['status'],
        orElse: () => BuildStatus.inProgress,
      ),
      soilSource: data['soilSource'] as String?,
      finishedAt: data['finishedAt'] != null
          ? (data['finishedAt'] as Timestamp).toDate()
          : null,
    );
  }

  Map<String, dynamic> toFirestore() => {
        'startedAt': Timestamp.fromDate(startedAt),
        'status': status.name,
        if (soilSource != null) 'soilSource': soilSource,
        if (finishedAt != null) 'finishedAt': Timestamp.fromDate(finishedAt!),
      };

  BuildModel copyWith({
    BuildStatus? status,
    String? soilSource,
    DateTime? finishedAt,
  }) =>
      BuildModel(
        id: id,
        startedAt: startedAt,
        status: status ?? this.status,
        soilSource: soilSource ?? this.soilSource,
        finishedAt: finishedAt ?? this.finishedAt,
      );
}
