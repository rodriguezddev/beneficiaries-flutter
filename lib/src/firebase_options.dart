import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
  show defaultTargetPlatform, kIsWeb, TargetPlatform;

import 'core/constants/firebase_constants.dart';

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          FirebaseConstants.unsupportedMacOSErrorText,
        );
    }

    throw UnsupportedError(FirebaseConstants.unsupportedErrorText);
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: FirebaseConstants.apiKeyWeb,
    appId: FirebaseConstants.appId,
    messagingSenderId: FirebaseConstants.messagingSenderId,
    projectId: FirebaseConstants.projectId,
    authDomain: FirebaseConstants.authDomain,
    storageBucket: FirebaseConstants.storageBucket,
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: FirebaseConstants.apiKeyAndroid,
    appId: FirebaseConstants.appId,
    messagingSenderId: FirebaseConstants.messagingSenderId,
    projectId: FirebaseConstants.projectId,
    storageBucket: FirebaseConstants.storageBucket,
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: FirebaseConstants.apiKeyIos,
    appId: FirebaseConstants.appId,
    messagingSenderId: FirebaseConstants.messagingSenderId,
    projectId: FirebaseConstants.projectId,
    storageBucket: FirebaseConstants.storageBucket,
    iosClientId: FirebaseConstants.iosClientId,
    iosBundleId: FirebaseConstants.iosBundleId,
  );
}
