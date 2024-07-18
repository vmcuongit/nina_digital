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
  GoRoute(
    name: NotificationScreen.nameRoute,
    path: NotificationScreen.pathRoute,
    builder: (context, state) {
      return const NotificationScreen();
    },
  ),
  GoRoute(
    name: ShoppingCartScreen.nameRoute,
    path: ShoppingCartScreen.pathRoute,
    builder: (context, state) {
      return const ShoppingCartScreen();
    },
  ),
  GoRoute(
      name: OrderScreen.nameRoute,
      path: OrderScreen.pathRoute,
      builder: (context, state) {
        return const OrderScreen();
      },
      routes: [
        GoRoute(
          name: OrderDetailScreen.nameRoute,
          path: OrderDetailScreen.pathRoute,
          builder: (context, state) {
            return OrderDetailScreen(
                code: state.pathParameters['code'].toString());
          },
        ),
      ]),
  GoRoute(
    name: SearchProductScreen.nameRoute,
    path: SearchProductScreen.pathRoute,
    pageBuilder: (context, state) {
      return _effectTransitionFade(context, state, const SearchProductScreen());
    },
  ),
  GoRoute(
    name: NewsDetailScreen.nameRoute,
    path: NewsDetailScreen.pathRoute,
    builder: (context, state) {
      return NewsDetailScreen(
        id: state.pathParameters['id'],
      );
    },
  ),
  GoRoute(
    name: ProfileScreen.nameRoute,
    path: ProfileScreen.pathRoute,
    builder: (context, state) {
      return const ProfileScreen();
    },
  ),
  GoRoute(
    name: AddressScreen.nameRoute,
    path: AddressScreen.pathRoute,
    builder: (context, state) {
      return const AddressScreen();
    },
  ),
  GoRoute(
    name: AddressDetailScreen.nameRouteEdit,
    path: AddressDetailScreen.pathRouteEdit,
    builder: (context, state) {
      return AddressDetailScreen(
        id: state.pathParameters['id'],
      );
    },
  ),
  GoRoute(
    name: AddressDetailScreen.nameRouteAdd,
    path: AddressDetailScreen.pathRouteAdd,
    builder: (context, state) {
      return const AddressDetailScreen();
    },
  ),
  GoRoute(
    name: ProductDetailScreen.nameRoute,
    path: ProductDetailScreen.pathRoute,
    builder: (context, state) {
      return ProductDetailScreen(id: state.pathParameters['id'] ?? '');
    },
  ),
];

ShellRouteBase addShellRouterMain() {
  return StatefulShellRoute.indexedStack(
    pageBuilder: (context, state, navigationShell) {
      return _effectTransitionFade(
          context, state, MainLayout(navigationShell: navigationShell));
    },
    branches: <StatefulShellBranch>[
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: HomeScreen.nameRoute,
            path: HomeScreen.pathRoute,
            builder: (context, state) {
              return const HomeScreen();
            },
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: FavoriteScreen.nameRoute,
            path: FavoriteScreen.pathRoute,
            builder: (context, state) {
              return const FavoriteScreen();
            },
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: StoresScreen.nameRoute,
            path: StoresScreen.pathRoute,
            builder: (context, state) {
              return StoresScreen();
            },
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
              routes: [
                GoRoute(
                  name: LanguageScreen.nameRoute,
                  path: LanguageScreen.pathRoute,
                  builder: (context, state) {
                    return const LanguageScreen();
                  },
                ),
                GoRoute(
                  name: SupportScreen.nameRoute,
                  path: SupportScreen.pathRoute,
                  builder: (context, state) {
                    return const SupportScreen();
                  },
                ),
              ]),
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
