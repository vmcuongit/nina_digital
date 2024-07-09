part of 'app_routes.dart';

List<RouteBase> _danhsachRoute = [
  GoRoute(
    name: OnboardingScreen.nameRoute,
    path: OnboardingScreen.pathRoute,
    pageBuilder: (context, state) {
      return _effectTransitionFade(context, state, const OnboardingScreen());
    },
  ),
  GoRoute(
    name: IntroAuthScreen.nameRoute,
    path: IntroAuthScreen.pathRoute,
    pageBuilder: (context, state) {
      return _effectTransitionFade(context, state, const IntroAuthScreen());
    },
  ),
  GoRoute(
    name: SignUpScreen.nameRoute,
    path: SignUpScreen.pathRoute,
    pageBuilder: (context, state) {
      return _effectTransitionFade(context, state, const SignUpScreen());
    },
  ),
  GoRoute(
    name: SignInScreen.nameRoute,
    path: SignInScreen.pathRoute,
    pageBuilder: (context, state) {
      return _effectTransitionFade(context, state, const SignInScreen());
    },
  ),
  GoRoute(
    name: ForgotPasswordScreen.nameRoute,
    path: ForgotPasswordScreen.pathRoute,
    builder: (context, state) {
      return const ForgotPasswordScreen();
    },
  ),
  GoRoute(
    name: HomeScreen.nameRoute,
    path: HomeScreen.pathRoute,
    pageBuilder: (context, state) {
      return _effectTransitionFade(context, state, const HomeScreen());
    },
  ),
];

CustomTransitionPage _effectTransitionFade(
    BuildContext context, GoRouterState state, Widget child) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 100),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: child,
      );
    },
  );
}
