part of 'app_routes.dart';

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

    if (AppConfig.mustLogin == true) {
      final authStatus =
          ref.watch(authUserProvider.select((value) => value.status));
      if (authStatus == AuthStatus.unauthenticated &&
          !state.matchedLocation.contains(ForgotPasswordScreen.pathRoute)) {
        return chuyenDenDangNhap();
      }
    }

    return null;
  }

  Future<String?> chuyenDenDangNhap() async {
    return SignInScreen.pathRoute;
  }

  @override
  void addListener(VoidCallback listener) {
    routerListener = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    routerListener = null;
  }
}
