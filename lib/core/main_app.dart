import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firebase_api.dart';
import '../localizations/app_localizations.dart';
import '../routes/app_routes.dart';
import '../shared/app_config.dart';
import '../shared/common_widgets/no_internet_widget.dart';
import '../shared/theme/app_theme.dart';
import 'app_providers/internet_provider.dart';
import 'app_setttings/app_setting_provider.dart';
import 'authentication_user/providers/auth_user_provider.dart';

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  @override
  void initState() {
    FirebaseMessaging.instance.onTokenRefresh.listen((token) async {
      if (token.isNotEmpty) {
        final AuthUserState authUserState = ref.watch(authUserProvider);

        if (authUserState.status == AuthStatus.authenticated &&
            authUserState.userLogin?.id != null) {
          await ref.read(authUserProvider.notifier).saveDeviceToken(token);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Load các settings (language, theme, ...)
    final appSetting = ref.watch(appSettingProvider);
    final language = appSetting.language.toString();
    final appTheme = ref.read(appSettingProvider.notifier).getThemeMode();

    // Load Routes
    final router = ref.watch(routerProvider);

    // kiểm tra kết nối internet (nếu có)
    var isConnected = true;
    if (AppConfig.offlineApp == false) {
      // check internet
      isConnected = ref.watch(internetProvider);
    }

    return MaterialApp.router(
      title: AppConfig.appTitle,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(language.toString()),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: appTheme,
      routerConfig: router,
      builder: (context, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              child ?? const SizedBox.shrink(),
              if (isConnected == false) const NoInternetWidget(),
            ],
          ),
        );
      },
    );
  }
}
