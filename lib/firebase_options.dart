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
    apiKey: 'AIzaSyDufStWdQa5xwaSyew7fjlSJoYlO5RIOTk',
    appId: '1:278545456778:web:e23ac6854d62dc06af5773',
    messagingSenderId: '278545456778',
    projectId: 'quantumitintership',
    authDomain: 'quantumitintership.firebaseapp.com',
    storageBucket: 'quantumitintership.appspot.com',
    measurementId: 'G-DHMK1H7CC8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD7MQ5_3MYQuRYlzM0Pdcn3UQKKzZKzH88',
    appId: '1:278545456778:android:2ddea416f46229d3af5773',
    messagingSenderId: '278545456778',
    projectId: 'quantumitintership',
    storageBucket: 'quantumitintership.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCqjWiQpV4LFD8RrJkySqlCSBKaMZ_t2XE',
    appId: '1:278545456778:ios:0b88420bcf20244baf5773',
    messagingSenderId: '278545456778',
    projectId: 'quantumitintership',
    storageBucket: 'quantumitintership.appspot.com',
    iosClientId: '278545456778-98iq0csomp89hhvjstrp8eskdcmficrq.apps.googleusercontent.com',
    iosBundleId: 'com.example.quantumInternship',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCqjWiQpV4LFD8RrJkySqlCSBKaMZ_t2XE',
    appId: '1:278545456778:ios:0b88420bcf20244baf5773',
    messagingSenderId: '278545456778',
    projectId: 'quantumitintership',
    storageBucket: 'quantumitintership.appspot.com',
    iosClientId: '278545456778-98iq0csomp89hhvjstrp8eskdcmficrq.apps.googleusercontent.com',
    iosBundleId: 'com.example.quantumInternship',
  );
}