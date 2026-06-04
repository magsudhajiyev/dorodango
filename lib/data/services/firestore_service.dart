import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';
import '../models/build_model.dart';
import '../models/stage_model.dart';

class FirestoreService {
  final FirebaseFirestore _db;

  FirestoreService({FirebaseFirestore? db})
      : _db = db ?? FirebaseFirestore.instance;

  // --- Users ---

  Future<void> createUser(UserModel user) async {
    await _db.collection('users').doc(user.uid).set(user.toFirestore());
  }

  Future<UserModel?> getUser(String uid) async {
    final doc = await _db.collection('users').doc(uid).get();
    if (!doc.exists) return null;
    return UserModel.fromFirestore(doc);
  }

  // --- Builds ---

  CollectionReference _buildsRef(String uid) =>
      _db.collection('users').doc(uid).collection('builds');

  Future<void> createBuild(String uid, BuildModel build) async {
    await _buildsRef(uid).doc(build.id).set(build.toFirestore());
  }

  Future<void> updateBuild(String uid, BuildModel build) async {
    await _buildsRef(uid).doc(build.id).update(build.toFirestore());
  }

  Stream<List<BuildModel>> watchBuilds(String uid) {
    return _buildsRef(uid)
        .orderBy('startedAt', descending: true)
        .snapshots()
        .map((snap) =>
            snap.docs.map((d) => BuildModel.fromFirestore(d)).toList());
  }

  Future<BuildModel?> getBuild(String uid, String buildId) async {
    final doc = await _buildsRef(uid).doc(buildId).get();
    if (!doc.exists) return null;
    return BuildModel.fromFirestore(doc);
  }

  // --- Stages ---

  CollectionReference _stagesRef(String uid, String buildId) =>
      _buildsRef(uid).doc(buildId).collection('stages');

  Future<void> addStage(String uid, String buildId, StageModel stage) async {
    await _stagesRef(uid, buildId)
        .doc(stage.stage.order.toString())
        .set(stage.toFirestore());
  }

  Future<void> updateStage(
      String uid, String buildId, StageModel stage) async {
    await _stagesRef(uid, buildId)
        .doc(stage.stage.order.toString())
        .update(stage.toFirestore());
  }

  Stream<List<StageModel>> watchStages(String uid, String buildId) {
    return _stagesRef(uid, buildId).orderBy('enteredAt').snapshots().map(
        (snap) =>
            snap.docs.map((d) => StageModel.fromFirestore(d)).toList());
  }

  Future<List<StageModel>> getStages(String uid, String buildId) async {
    final snap =
        await _stagesRef(uid, buildId).orderBy('enteredAt').get();
    return snap.docs.map((d) => StageModel.fromFirestore(d)).toList();
  }
}
