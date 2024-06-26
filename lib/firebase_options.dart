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
    apiKey: 'AIzaSyBYaiZXQJ0YbeuuDH6SCxOECKYIoKwFnR8',
    appId: '1:201438828645:web:9bcbdec3820f920a794e8c',
    messagingSenderId: '201438828645',
    projectId: 'realestate-41554',
    authDomain: 'realestate-41554.firebaseapp.com',
    storageBucket: 'realestate-41554.appspot.com',
    measurementId: 'G-1V32SZRMQQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCIkcllEJW6ms5ajCzI95XJT7QoEDdWr7I',
    appId: '1:201438828645:android:5165b04437cf9c3a794e8c',
    messagingSenderId: '201438828645',
    projectId: 'realestate-41554',
    storageBucket: 'realestate-41554.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBiEeo-boewTEBR_-w5hVvGtxvErtePLxI',
    appId: '1:201438828645:ios:cf1318fa8d85df59794e8c',
    messagingSenderId: '201438828645',
    projectId: 'realestate-41554',
    storageBucket: 'realestate-41554.appspot.com',
    iosBundleId: 'com.example.api',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBiEeo-boewTEBR_-w5hVvGtxvErtePLxI',
    appId: '1:201438828645:ios:f20c849752c086f4794e8c',
    messagingSenderId: '201438828645',
    projectId: 'realestate-41554',
    storageBucket: 'realestate-41554.appspot.com',
    iosBundleId: 'com.example.api.RunnerTests',
  );
}
