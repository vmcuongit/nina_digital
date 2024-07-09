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
  addShellRouterMain(),
];

ShellRouteBase addShellRouterMain() {
  return StatefulShellRoute.indexedStack(
    pageBuilder: (context, state, navigationShell) {
      return _effectTransitionFade(
          context, state, MainLayout(navigationShell: navigationShell));
    },
    branches: <StatefulShellBranch>[
      // Màn hình Dịch vụ
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: HomeScreen.nameRoute,
            path: HomeScreen.pathRoute,
            builder: (context, state) {
              return const HomeScreen();
            },
            // pageBuilder: (context, state) {
            //   return _effectTransitionFade(context, state, const HomeScreen());
            // },
          ),
        ],
      ),

      // Màn hình hỗ trợ
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: FavoriteScreen.nameRoute,
            path: FavoriteScreen.pathRoute,
            builder: (context, state) {
              return const FavoriteScreen();
            },
            // pageBuilder: (context, state) {
            //   return _effectTransitionFade(
            //       context, state, const FavoriteScreen());
            // },
          ),
        ],
      ),
      // Màn hình Home
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: ProductCategoryScreen.nameRoute,
            path: ProductCategoryScreen.pathRoute,
            builder: (context, state) {
              return const ProductCategoryScreen();
            },
            // pageBuilder: (context, state) {
            //   return _effectTransitionFade(
            //       context, state, const ProductCategoryScreen());
            // },
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: NewsScreen.nameRoute,
            path: NewsScreen.pathRoute,
            builder: (context, state) {
              return const NewsScreen();
            },
            // pageBuilder: (context, state) {
            //   return _effectTransitionFade(context, state, const NewsScreen());
            // },
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: AccountScreen.nameRoute,
            path: AccountScreen.pathRoute,
            builder: (context, state) {
              return const AccountScreen();
            },
            // pageBuilder: (context, state) {
            //   return _effectTransitionFade(
            //       context, state, const AccountScreen());
            // },
          ),
        ],
      ),
    ],
  );
}

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
