import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../core/utils/geohash.dart';

/// Registers this device for "dorodango planted near you" notifications by
/// storing the FCM token and last known location on the user document.
/// The notifyNearbyHunters Cloud Function reads these when a plant is created.
class HuntNotificationService {
  final FirebaseFirestore _db;
  final FirebaseMessaging _messaging;

  HuntNotificationService({
    FirebaseFirestore? firestore,
    FirebaseMessaging? messaging,
  })  : _db = firestore ?? FirebaseFirestore.instance,
        _messaging = messaging ?? FirebaseMessaging.instance;

  /// Best-effort: notification failures must never break the hunt itself.
  Future<void> register({
    required String uid,
    required double latitude,
    required double longitude,
  }) async {
    try {
      final settings = await _messaging.requestPermission();
      String? token;
      if (settings.authorizationStatus == AuthorizationStatus.authorized ||
          settings.authorizationStatus == AuthorizationStatus.provisional) {
        token = await _messaging.getToken();
      }
      await _db.collection('users').doc(uid).set({
        'fcmToken': ?token,
        'lastLat': latitude,
        'lastLng': longitude,
        'lastGeohash': geohashEncode(latitude, longitude),
        'lastSeenAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (_) {
      // Ignore — hunting still works without push notifications.
    }
  }
}
