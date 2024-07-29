import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../local_storage/local_storage.dart';
import '../../shared/app_config.dart';
import '../authentication_user/providers/auth_user_provider.dart';

final appStartupProvider = FutureProvider((ref) async {
  // init Local Storage
  await LocalStorage.init();

  // init App
  await AppConfig().initApp(ref);

  if (AppConfig.mustLogin == true) {
    ref.read(authUserProvider.notifier).checkSignIn();
  }

  // Tắt màn hình splash
  FlutterNativeSplash.remove();
});
