import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../local_storage/local_storage.dart';
import '../../shared/app_config.dart';
import '../app_setttings/app_setting_provider.dart';
import '../authentication_user/providers/auth_user_provider.dart';

final appStartupProvider = FutureProvider((ref) async {
  // init Local Storage
  await LocalStorage.init();

  // Load cấu hình App
  await ref.read(appSettingProvider.notifier).init();

  // load thông tin user đang đăng nhập
  if (AppConfig.hasLogin == true) {
    await ref.read(authUserProvider.notifier).init();
  }

  // init App
  await AppConfig().initApp(ref);

  // Tắt màn hình splash
  FlutterNativeSplash.remove();
});
