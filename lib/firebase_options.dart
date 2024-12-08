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
    apiKey: 'AIzaSyAA5XeZR1aFPewNIL3UbjWLT95IAiisfTQ',
    appId: '1:612575769972:web:1b3ea69536e41d94b26821',
    messagingSenderId: '612575769972',
    projectId: 'app-3bb8a',
    authDomain: 'app-3bb8a.firebaseapp.com',
    storageBucket: 'app-3bb8a.firebasestorage.app',
    measurementId: 'G-M8EQDEG2VV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCjiEJzhtd4L89WIllez4DshiVUyH3k_As',
    appId: '1:612575769972:android:6f083ff10f06ad74b26821',
    messagingSenderId: '612575769972',
    projectId: 'app-3bb8a',
    storageBucket: 'app-3bb8a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCeU1PlyGW3gU0QoOi9vyEfn2PT_tDFLG0',
    appId: '1:612575769972:ios:95cb303ac199ec06b26821',
    messagingSenderId: '612575769972',
    projectId: 'app-3bb8a',
    storageBucket: 'app-3bb8a.firebasestorage.app',
    iosBundleId: 'com.example.mindsphere',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCeU1PlyGW3gU0QoOi9vyEfn2PT_tDFLG0',
    appId: '1:612575769972:ios:95cb303ac199ec06b26821',
    messagingSenderId: '612575769972',
    projectId: 'app-3bb8a',
    storageBucket: 'app-3bb8a.firebasestorage.app',
    iosBundleId: 'com.example.mindsphere',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAA5XeZR1aFPewNIL3UbjWLT95IAiisfTQ',
    appId: '1:612575769972:web:6c0dce96b5835332b26821',
    messagingSenderId: '612575769972',
    projectId: 'app-3bb8a',
    authDomain: 'app-3bb8a.firebaseapp.com',
    storageBucket: 'app-3bb8a.firebasestorage.app',
    measurementId: 'G-C0C32CSTE4',
  );

}