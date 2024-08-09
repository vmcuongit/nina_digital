import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/app_startup/app_startup_widget.dart';
import 'firebase_api.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Khoá chế độ xoay màn hình
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Splash khởi chạy
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // iOS hiện tại chưa có tài khoản Apple Dev để test
  // if (Platform.isAndroid) {
  //   final FirebaseApi firebaseApi = FirebaseApi();
  //   await firebaseApi.initNotifications();
  //   await FirebaseApi.setupFlutterNotifications();
  //   FirebaseApi.setupForegroundMessages();
  //   FirebaseApi.setupInteractedMessage();
  // }

  // final FirebaseApi firebaseApi = FirebaseApi();
  // await firebaseApi.initNotifications();
  // await FirebaseApi.setupFlutterNotifications();
  // FirebaseApi.setupForegroundMessages();
  // FirebaseApi.setupInteractedMessage();

  runApp(const ProviderScope(
    child: AppStartupWidget(),
  ));
}
