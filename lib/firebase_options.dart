// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
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
    apiKey: 'AIzaSyCR8dE754sXTj59UCX4UGTqHf8WkTZopkk',
    appId: '1:623082318493:web:d448cd1723d4aa3910c274',
    messagingSenderId: '623082318493',
    projectId: 'aqwa-9f665',
    authDomain: 'aqwa-9f665.firebaseapp.com',
    storageBucket: 'aqwa-9f665.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDmzbXZ5AgTXBEtvZp84k3LbgZXH6p1FpY',
    appId: '1:623082318493:android:f63a7a961725424f10c274',
    messagingSenderId: '623082318493',
    projectId: 'aqwa-9f665',
    storageBucket: 'aqwa-9f665.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD2y65HSxszxzAcAqjaLR9EDn3-_KN5CSo',
    appId: '1:623082318493:ios:48837b8e3e25c16a10c274',
    messagingSenderId: '623082318493',
    projectId: 'aqwa-9f665',
    storageBucket: 'aqwa-9f665.appspot.com',
    iosBundleId: 'com.example.untitled111',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD2y65HSxszxzAcAqjaLR9EDn3-_KN5CSo',
    appId: '1:623082318493:ios:772a01c59d35f76c10c274',
    messagingSenderId: '623082318493',
    projectId: 'aqwa-9f665',
    storageBucket: 'aqwa-9f665.appspot.com',
    iosBundleId: 'com.example.untitled111.RunnerTests',
  );
}
