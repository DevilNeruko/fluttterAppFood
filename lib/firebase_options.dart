// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDupPvWwfY2NNWFMgl9jM5uAUKyDSHASRA',
    appId: '1:313451663754:web:fced290333765f39a67873',
    messagingSenderId: '313451663754',
    projectId: 'eiei-6a1b4',
    authDomain: 'eiei-6a1b4.firebaseapp.com',
    storageBucket: 'eiei-6a1b4.firebasestorage.app',
    measurementId: 'G-85583PGDD8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDVjFr2oYnOTY1cER3p-WWydYTBIA-TTrs',
    appId: '1:313451663754:android:09fd5f3c0abf5995a67873',
    messagingSenderId: '313451663754',
    projectId: 'eiei-6a1b4',
    storageBucket: 'eiei-6a1b4.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCehFibK7uqgYlPEZ-GZeQbmlvUNcCQ6lo',
    appId: '1:313451663754:ios:b9b5620b124ec919a67873',
    messagingSenderId: '313451663754',
    projectId: 'eiei-6a1b4',
    storageBucket: 'eiei-6a1b4.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCehFibK7uqgYlPEZ-GZeQbmlvUNcCQ6lo',
    appId: '1:313451663754:ios:b9b5620b124ec919a67873',
    messagingSenderId: '313451663754',
    projectId: 'eiei-6a1b4',
    storageBucket: 'eiei-6a1b4.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDupPvWwfY2NNWFMgl9jM5uAUKyDSHASRA',
    appId: '1:313451663754:web:b54d6dd10e48e4c8a67873',
    messagingSenderId: '313451663754',
    projectId: 'eiei-6a1b4',
    authDomain: 'eiei-6a1b4.firebaseapp.com',
    storageBucket: 'eiei-6a1b4.firebasestorage.app',
    measurementId: 'G-22S8SEK6T3',
  );
}
