// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBYw_KY7aN0xGmnEhqQNQ-rM0Zjbzk9z7M',
    appId: '1:129048992702:web:85dcf7aca4a0a8f116f7ef',
    messagingSenderId: '129048992702',
    projectId: 'habits-1c8c6',
    authDomain: 'habits-1c8c6.firebaseapp.com',
    storageBucket: 'habits-1c8c6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvsIuRmuxok72nr2nWZ2kD0RJvGFhfYME',
    appId: '1:129048992702:android:c90446f13f1eefa516f7ef',
    messagingSenderId: '129048992702',
    projectId: 'habits-1c8c6',
    storageBucket: 'habits-1c8c6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3jRyvOZplILEl99UHUHuMYC2182ZKTZA',
    appId: '1:129048992702:ios:e920482b2f3c2c4f16f7ef',
    messagingSenderId: '129048992702',
    projectId: 'habits-1c8c6',
    storageBucket: 'habits-1c8c6.appspot.com',
    iosClientId: '129048992702-8vng5kj00p3qcobgc1a0m9kbghsc3s4k.apps.googleusercontent.com',
    iosBundleId: 'com.example.habits',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3jRyvOZplILEl99UHUHuMYC2182ZKTZA',
    appId: '1:129048992702:ios:e920482b2f3c2c4f16f7ef',
    messagingSenderId: '129048992702',
    projectId: 'habits-1c8c6',
    storageBucket: 'habits-1c8c6.appspot.com',
    iosClientId: '129048992702-8vng5kj00p3qcobgc1a0m9kbghsc3s4k.apps.googleusercontent.com',
    iosBundleId: 'com.example.habits',
  );
}
