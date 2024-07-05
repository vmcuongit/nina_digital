import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerNotifierProvider =
    AsyncNotifierProvider<AppRouterNotifier, void>(() {
  return AppRouterNotifier();
});

class AppRouterNotifier extends AsyncNotifier<void> implements Listenable {
  VoidCallback? routerListener;

  @override
  Future<void> build() async {
    ref.listenSelf((_, __) {
      if (state.isLoading) return;
      routerListener?.call();
    });
  }

  ///Kiểm tra các điều kiện và chuyển hướng người dùng
  Future<String?>? redirect(BuildContext context, GoRouterState state) {
    if (this.state.isLoading || this.state.hasError) return null;

    // if (AppConfig.mustLogin == true) {
    //   authentication();
    //   if (authStatus == AuthStatus.unauthenticated &&
    //       !state.matchedLocation.contains(pathForgotPassword)) {
    //     return chuyenDenDangNhap();
    //   }
    // }

    return null;
  }

  // Future authentication() async {
  //   authStatus = ref.watch(authProvider.select((value) => value.authStatus));
  // }

  // Future<String?> chuyenDenDangNhap() async {
  //   return pathSignIn;
  // }

  @override
  void addListener(VoidCallback listener) {
    routerListener = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    routerListener = null;
  }
}
