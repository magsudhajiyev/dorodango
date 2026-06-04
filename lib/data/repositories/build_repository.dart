import 'dart:io';
import 'package:uuid/uuid.dart';
import '../models/build_model.dart';
import '../models/stage_model.dart';
import '../models/build_stage.dart';
import '../services/firestore_service.dart';
import '../services/storage_service.dart';

class BuildRepository {
  final FirestoreService _firestore;
  final StorageService _storage;
  static const _uuid = Uuid();

  BuildRepository(this._firestore, this._storage);

  Future<BuildModel> startBuild(String uid, {String? soilSource}) async {
    final build = BuildModel(
      id: _uuid.v4(),
      startedAt: DateTime.now(),
      status: BuildStatus.inProgress,
      soilSource: soilSource,
    );
    await _firestore.createBuild(uid, build);

    final stage = StageModel(
      stage: BuildStage.coreForming,
      enteredAt: DateTime.now(),
    );
    await _firestore.addStage(uid, build.id, stage);

    return build;
  }

  Future<void> advanceStage({
    required String uid,
    required String buildId,
    required BuildStage currentStage,
    required int durationSec,
    File? photo,
  }) async {
    String? photoUrl;
    if (photo != null) {
      try {
        photoUrl = await _storage.uploadStagePhoto(
          uid: uid,
          buildId: buildId,
          stageKey: currentStage.order.toString(),
          imageFile: photo,
        );
      } catch (_) {
        // Photo upload failed — don't block stage advancement
      }
    }

    // Update current stage with duration and photo
    final updatedStage = StageModel(
      stage: currentStage,
      enteredAt: DateTime.now(),
      photoUrl: photoUrl,
      durationSec: durationSec,
    );
    await _firestore.updateStage(uid, buildId, updatedStage);

    // Create next stage if not terminal
    final nextStage = currentStage.next;
    if (nextStage != null) {
      final newStage = StageModel(
        stage: nextStage,
        enteredAt: DateTime.now(),
      );
      await _firestore.addStage(uid, buildId, newStage);

      if (nextStage.isTerminal) {
        final build = await _firestore.getBuild(uid, buildId);
        if (build != null) {
          await _firestore.updateBuild(
            uid,
            build.copyWith(
              status: BuildStatus.completed,
              finishedAt: DateTime.now(),
            ),
          );
        }
      }
    }
  }

  Stream<List<BuildModel>> watchBuilds(String uid) =>
      _firestore.watchBuilds(uid);

  Stream<List<StageModel>> watchStages(String uid, String buildId) =>
      _firestore.watchStages(uid, buildId);

  Future<List<StageModel>> getStages(String uid, String buildId) =>
      _firestore.getStages(uid, buildId);
}
