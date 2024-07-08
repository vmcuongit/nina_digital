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
    name: IndexAuthScreen.nameRoute,
    path: IndexAuthScreen.pathRoute,
    builder: (context, state) {
      return const IndexAuthScreen();
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