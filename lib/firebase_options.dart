import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError('Web is not supported in this configuration.');
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDmwfX5fVjt3uKBl-iOlXaOmWJUMsMrVHI',
    appId: '1:252067065633:android:55a5eec737b032dd2cd860',
    messagingSenderId: '252067065633',
    projectId: 'dorodango-app',
    storageBucket: 'dorodango-app.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA8I1aM8wxYaYaQs4epbNfh9snDiHaMEsc',
    appId: '1:252067065633:ios:a4996b4b284b7d542cd860',
    messagingSenderId: '252067065633',
    projectId: 'dorodango-app',
    storageBucket: 'dorodango-app.firebasestorage.app',
    iosBundleId: 'com.dorodango.dorodango',
  );
}
