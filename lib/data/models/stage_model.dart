import 'package:cloud_firestore/cloud_firestore.dart';
import 'build_stage.dart';

class StageModel {
  final BuildStage stage;
  final DateTime enteredAt;
  final String? photoUrl;
  final String? diagnosis;
  final int? durationSec;

  const StageModel({
    required this.stage,
    required this.enteredAt,
    this.photoUrl,
    this.diagnosis,
    this.durationSec,
  });

  factory StageModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return StageModel(
      stage: BuildStage.values.firstWhere(
        (e) => e.firestoreValue == data['stage'],
      ),
      enteredAt: (data['enteredAt'] as Timestamp).toDate(),
      photoUrl: data['photoUrl'] as String?,
      diagnosis: data['diagnosis'] as String?,
      durationSec: data['durationSec'] as int?,
    );
  }

  Map<String, dynamic> toFirestore() => {
        'stage': stage.firestoreValue,
        'enteredAt': Timestamp.fromDate(enteredAt),
        if (photoUrl != null) 'photoUrl': photoUrl,
        if (diagnosis != null) 'diagnosis': diagnosis,
        if (durationSec != null) 'durationSec': durationSec,
      };

  StageModel copyWith({
    String? photoUrl,
    String? diagnosis,
    int? durationSec,
  }) =>
      StageModel(
        stage: stage,
        enteredAt: enteredAt,
        photoUrl: photoUrl ?? this.photoUrl,
        diagnosis: diagnosis ?? this.diagnosis,
        durationSec: durationSec ?? this.durationSec,
      );
}
