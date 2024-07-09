import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/app_setttings/app_setting_provider.dart';
import '../features/forgot_password/forgot_password_screen.dart';
import '../features/home/home_screen.dart';
import '../features/intro_auth/intro_auth_screen.dart';
import '../features/onboarding/onboarding_screen.dart';
import '../features/sign_in/sign_in_screen.dart';
import '../features/sign_up/sign_up_screen.dart';
import '../shared/app_config.dart';
import '../shared/common_widgets/error_404_widget.dart';
import 'app_router_notifier.dart';

part 'routes.dart';

final _routerKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

final routerProvider = Provider<GoRouter>((ref) {
  final notifier = ref.watch(routerNotifierProvider.notifier);

  final loadOnboarding =
      ref.watch(appSettingProvider.select((value) => value.onboarding));

  return GoRouter(
    navigatorKey: _routerKey,
    debugLogDiagnostics: AppConfig.debugLogDiagnostics,
    initialLocation:
        (loadOnboarding == false && AppConfig.pathOnboarding.isNotEmpty)
            ? AppConfig.pathOnboarding
            : AppConfig.initialPath,
    refreshListenable: notifier,
    routes: _danhsachRoute,
    redirect: notifier.redirect,
    errorPageBuilder: (context, state) =>
        _effectTransitionFade(context, state, const Error404Widget()),
  );
});
