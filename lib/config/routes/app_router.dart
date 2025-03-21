import 'package:ecommerce_pojo/config/routes/page_route_name.dart';
import 'package:ecommerce_pojo/features/mainScreen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

BuildContext? get currentContext_ => GoRouterConfig.navigatorKey.currentContext;

class GoRouterConfig {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static GoRouter get router => _router;
  static final GoRouter _router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: PageRouteName.home,
    routes: <RouteBase>[
      GoRoute(
        path: PageRouteName.splash,
        pageBuilder: (_, GoRouterState state) => getCustomTransitionPage(
          state: state,
          child: const Placeholder(),
        ),
      ),
      GoRoute(
        path: PageRouteName.onboarding,
        pageBuilder: (_, GoRouterState state) => getCustomTransitionPage(
          state: state,
          child: const Placeholder(),
        ),
      ),
      GoRoute(
        path: PageRouteName.login,
        pageBuilder: (_, GoRouterState state) => getCustomTransitionPage(
          state: state,
          child: const Placeholder(),
        ),
      ),
      GoRoute(
        path: PageRouteName.signup,
        pageBuilder: (_, GoRouterState state) => getCustomTransitionPage(
          state: state,
          child: const Placeholder(),
        ),
      ),
      GoRoute(
        path: PageRouteName.emailVerification,
        pageBuilder: (_, GoRouterState state) => getCustomTransitionPage(
          state: state,
          child: const Placeholder(),
        ),
      ),
      ShellRoute(
        builder: (context, state, child) => MainScreen(child: child),
        routes: [
          GoRoute(
            path: PageRouteName.home,
            pageBuilder: (_, GoRouterState state) => getCustomTransitionPage(
              state: state,
              child: const Placeholder(),
            ),
          ),
          GoRoute(
            path: PageRouteName.cart,
            pageBuilder: (_, GoRouterState state) => getCustomTransitionPage(
              state: state,
              child: const Placeholder(),
            ),
          ),
          GoRoute(
            path: PageRouteName.profile,
            pageBuilder: (_, GoRouterState state) => getCustomTransitionPage(
              state: state,
              child: const Placeholder(),
            ),
          ),
          GoRoute(
            path: PageRouteName.wishlist,
            pageBuilder: (_, GoRouterState state) => getCustomTransitionPage(
              state: state,
              child: const Placeholder(),
            ),
          ),
          GoRoute(
            path: PageRouteName.categories,
            pageBuilder: (_, GoRouterState state) => getCustomTransitionPage(
              state: state,
              child: const Placeholder(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: PageRouteName.productDetails,
        pageBuilder: (_, GoRouterState state) => getCustomTransitionPage(
          state: state,
          child: const Placeholder(),
        ),
      ),
      GoRoute(
        path: PageRouteName.checkoutSipping,
        pageBuilder: (_, GoRouterState state) => getCustomTransitionPage(
          state: state,
          child: const Placeholder(),
        ),
      ),
      GoRoute(
        path: PageRouteName.checkoutPayment,
        pageBuilder: (_, GoRouterState state) => getCustomTransitionPage(
          state: state,
          child: const Placeholder(),
        ),
      ),
      GoRoute(
        path: PageRouteName.checkoutReview,
        pageBuilder: (_, GoRouterState state) => getCustomTransitionPage(
          state: state,
          child: const Placeholder(),
        ),
      ),
    ],
  );

  static CustomTransitionPage getCustomTransitionPage(
      {required GoRouterState state, required Widget child}) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  }
}
