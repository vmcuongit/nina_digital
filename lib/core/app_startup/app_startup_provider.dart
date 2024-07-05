import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/app_config.dart';
import '../app_setttings/app_setting_provider.dart';

final appStartupProvider = FutureProvider((ref) async {
  // Load cấu hình App
  await ref.read(appSettingProvider.notifier).init();

  // init App
  await AppConfig().initApp(ref);

  // Tắt màn hình splash
  FlutterNativeSplash.remove();
});
