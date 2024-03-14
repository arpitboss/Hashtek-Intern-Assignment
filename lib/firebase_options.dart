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
    apiKey: 'AIzaSyBfcIpa_oG8KK-8wjPAtMH7ZcSfADts0II',
    appId: '1:145629195924:web:4f3933656eb82eb4f9ce81',
    messagingSenderId: '145629195924',
    projectId: 'hashtek-intern',
    authDomain: 'hashtek-intern.firebaseapp.com',
    storageBucket: 'hashtek-intern.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB-X8FgHXplMuxv2BQsjWtp7pp4bWk8J78',
    appId: '1:145629195924:android:e516c0745f2d222ef9ce81',
    messagingSenderId: '145629195924',
    projectId: 'hashtek-intern',
    storageBucket: 'hashtek-intern.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBjUXWVCTIl8iJnHlukZWWouQnVlPBfDrc',
    appId: '1:145629195924:ios:858bb0b20be7fb82f9ce81',
    messagingSenderId: '145629195924',
    projectId: 'hashtek-intern',
    storageBucket: 'hashtek-intern.appspot.com',
    iosBundleId: 'com.example.hashtekInternAssignment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBjUXWVCTIl8iJnHlukZWWouQnVlPBfDrc',
    appId: '1:145629195924:ios:a313c6e9147182c4f9ce81',
    messagingSenderId: '145629195924',
    projectId: 'hashtek-intern',
    storageBucket: 'hashtek-intern.appspot.com',
    iosBundleId: 'com.example.hashtekInternAssignment.RunnerTests',
  );
}