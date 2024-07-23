import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/app_config.dart';

final appStartupProvider = FutureProvider((ref) async {
  // init App
  await AppConfig().initApp(ref);

  // Tắt màn hình splash
  FlutterNativeSplash.remove();
});
