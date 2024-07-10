import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../localizations/app_localizations.dart';
import '../routes/app_routes.dart';
import '../shared/app_config.dart';
import '../shared/common_widgets/no_internet_widget.dart';
import '../shared/theme/app_theme.dart';
import 'app_providers/internet_provider.dart';
import 'app_setttings/app_setting_provider.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              child ?? Container(),
              if (isConnected == false) const NoInternetWidget(),
            ],
          ),
        );
      },
    );
  }
}
