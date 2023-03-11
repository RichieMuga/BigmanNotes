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
    apiKey: 'AIzaSyDzdzhItAXlOAhZd81aZjKZle44shHRqGo',
    appId: '1:358758820966:web:85d437f67b72088d7191a7',
    messagingSenderId: '358758820966',
    projectId: 'note-down-254',
    authDomain: 'note-down-254.firebaseapp.com',
    storageBucket: 'note-down-254.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBDMyK8e5CJXqmKMBoeNiWTSw9bTderocw',
    appId: '1:358758820966:android:1edabdba643d259c7191a7',
    messagingSenderId: '358758820966',
    projectId: 'note-down-254',
    storageBucket: 'note-down-254.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-_g4jSszPqUSzciZM7QzhbXbEw8YcTIA',
    appId: '1:358758820966:ios:0bde76515b95fa0e7191a7',
    messagingSenderId: '358758820966',
    projectId: 'note-down-254',
    storageBucket: 'note-down-254.appspot.com',
    iosClientId: '358758820966-67iv65gi330g3rlf79lmtd81qifekght.apps.googleusercontent.com',
    iosBundleId: 'com.example.bigmannotes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB-_g4jSszPqUSzciZM7QzhbXbEw8YcTIA',
    appId: '1:358758820966:ios:0bde76515b95fa0e7191a7',
    messagingSenderId: '358758820966',
    projectId: 'note-down-254',
    storageBucket: 'note-down-254.appspot.com',
    iosClientId: '358758820966-67iv65gi330g3rlf79lmtd81qifekght.apps.googleusercontent.com',
    iosBundleId: 'com.example.bigmannotes',
  );
}