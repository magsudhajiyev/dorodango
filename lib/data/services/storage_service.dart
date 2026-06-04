import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage;

  StorageService({FirebaseStorage? storage})
      : _storage = storage ?? FirebaseStorage.instance;

  Future<String> uploadStagePhoto({
    required String uid,
    required String buildId,
    required String stageKey,
    required File imageFile,
  }) async {
    // Use the current auth uid to ensure it matches Storage security rules
    final authUid = FirebaseAuth.instance.currentUser?.uid ?? uid;
    final ref = _storage.ref('users/$authUid/builds/$buildId/stages/$stageKey.jpg');
    await ref.putFile(imageFile, SettableMetadata(contentType: 'image/jpeg'));
    return await ref.getDownloadURL();
  }
}
