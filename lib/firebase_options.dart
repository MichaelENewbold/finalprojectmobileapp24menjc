// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

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

 

class NewDefaultFirebaseOptions {
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
    apiKey: 'AIzaSyDz93GSbbfoSj-4cOBCpjjD2NQGjbJQRmk',
    appId: '1:1083255068373:web:6fcd4dcc98f23d407c345c',
    messagingSenderId: '1083255068373',
    projectId: 'finalprojectmobileapp24menjc',
    authDomain: 'finalprojectmobileapp24menjc.firebaseapp.com',
    storageBucket: 'finalprojectmobileapp24menjc.firebasestorage.app',
    measurementId: 'G-LHGXLH971S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAUNQY3KuHzLgOLgh5zhfnmae9w3reXMc4',
    appId: '1:1083255068373:android:fc9d448343805e4d7c345c',
    messagingSenderId: '1083255068373',
    projectId: 'finalprojectmobileapp24menjc',
    storageBucket: 'finalprojectmobileapp24menjc.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDUiwIHDuIPalHQGCGqrYo-TVxgjfsGZXg',
    appId: '1:1083255068373:ios:dbc8de29c85b79647c345c',
    messagingSenderId: '1083255068373',
    projectId: 'finalprojectmobileapp24menjc',
    storageBucket: 'finalprojectmobileapp24menjc.firebasestorage.app',
    iosBundleId: 'com.example.finalproject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDUiwIHDuIPalHQGCGqrYo-TVxgjfsGZXg',
    appId: '1:1083255068373:ios:dbc8de29c85b79647c345c',
    messagingSenderId: '1083255068373',
    projectId: 'finalprojectmobileapp24menjc',
    storageBucket: 'finalprojectmobileapp24menjc.firebasestorage.app',
    iosBundleId: 'com.example.finalproject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDz93GSbbfoSj-4cOBCpjjD2NQGjbJQRmk',
    appId: '1:1083255068373:web:c0332f2ea4e6da837c345c',
    messagingSenderId: '1083255068373',
    projectId: 'finalprojectmobileapp24menjc',
    authDomain: 'finalprojectmobileapp24menjc.firebaseapp.com',
    storageBucket: 'finalprojectmobileapp24menjc.firebasestorage.app',
    measurementId: 'G-Q20E6KQM98',
  );

}