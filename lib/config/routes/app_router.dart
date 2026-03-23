import 'package:ecommerce_pojo/config/routes/page_route_name.dart';
import 'package:ecommerce_pojo/di.dart';
import 'package:ecommerce_pojo/features/auth/presentation/pages/forgot_password_screen.dart';
import 'package:ecommerce_pojo/features/auth/presentation/pages/signin_screen.dart';
import 'package:ecommerce_pojo/features/auth/presentation/pages/signup_screen.dart';
import 'package:ecommerce_pojo/features/mainScreen/cart/presentation/pages/cart_tab.dart';
import 'package:ecommerce_pojo/features/mainScreen/category/presentation/pages/categories_tab.dart';
import 'package:ecommerce_pojo/features/mainScreen/category/presentation/pages/sup_categories_screen.dart';
import 'package:ecommerce_pojo/features/mainScreen/home/presentation/pages/home_tab.dart';
import 'package:ecommerce_pojo/features/mainScreen/main_screen.dart';
import 'package:ecommerce_pojo/features/mainScreen/profile/presentation/bloc/profile_bloc.dart';
import 'package:ecommerce_pojo/features/mainScreen/profile/presentation/pages/profile_tab.dart';
import 'package:ecommerce_pojo/features/mainScreen/profile/presentation/pages/shipping_address_page.dart';
import 'package:ecommerce_pojo/features/mainScreen/wishlist/presentation/pages/wishlist_tab.dart';
import 'package:ecommerce_pojo/features/onboarding/presentation/pages/onBoarding_screen.dart';
import 'package:ecommerce_pojo/features/product/presentation/pages/product_details_screen.dart';
import 'package:ecommerce_pojo/features/product/presentation/pages/products_screen.dart';
import 'package:ecommerce_pojo/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pay_with_paymob/pay_with_paymob.dart';

BuildContext? get currentContext_ => GoRouterConfig.navigatorKey.currentContext;

class GoRouterConfig {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static GoRouter get router => _router;
  static final GoRouter _router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: PageRouteName.splash,
    routes: <RouteBase>[
      GoRoute(
        path: PageRouteName.splash,
        pageBuilder: (_, GoRouterState state) => getCustomTransitionPage(
          state: state,
          child: const SplashScreen(),
        ),
      ),
      GoRoute(
        path: PageRouteName.onboarding,
        pageBuilder: (_, GoRouterState state) => getCustomTransitionPage(
          state: state,
          child: const OnboardingScreen(),
        ),
      ),
      GoRoute(
        path: PageRouteName.login,
        pageBuilder: (_, GoRouterState state) => getCustomTransitionPage(
          state: state,
          child: const SigninScreen(),
        ),
      ),
      GoRoute(
        path: PageRouteName.signup,
        pageBuilder: (_, GoRouterState state) => getCustomTransitionPage(
          state: state,
          child: const SignupScreen(),
        ),
      ),
      GoRoute(
        path: PageRouteName.emailVerification,
        pageBuilder: (_, GoRouterState state) => getCustomTransitionPage(
          state: state,
          child: const Placeholder(),
        ),
      ),
      GoRoute(
        path: PageRouteName.forgotPassword,
        pageBuilder: (_, GoRouterState state) => getCustomTransitionPage(
          state: state,
          child: const ForgotPasswordScreen(),
        ),
      ),
      ShellRoute(
        builder: (context, state, child) => MainScreen(child: child),
        routes: [
          GoRoute(
            path: PageRouteName.home,
            pageBuilder: (_, GoRouterState state) => getCustomTransitionPage(
              state: state,
              child: const HomeTab(),
            ),
          ),
          GoRoute(
            path: PageRouteName.cart,
            pageBuilder: (_, GoRouterState state) => getCustomTransitionPage(
              state: state,
              child: const CartTab(),
            ),
          ),
          GoRoute(
            path: PageRouteName.profile,
            pageBuilder: (_, GoRouterState state) => getCustomTransitionPage(
              state: state,
              child: const ProfileTab(),
            ),
          ),
          GoRoute(
            path: PageRouteName.wishlist,
            pageBuilder: (_, GoRouterState state) => getCustomTransitionPage(
              state: state,
              child: const WishlistTab(),
            ),
          ),
          GoRoute(
            path: PageRouteName.categories,
            pageBuilder: (_, GoRouterState state) => getCustomTransitionPage(
              state: state,
              child: const CategoriesTab(),
            ),
          ),
          GoRoute(
              path: PageRouteName.subCategories,
              pageBuilder: (_, GoRouterState state) {
                var data = state.extra as Map<String, dynamic>;
                return getCustomTransitionPage(
                  state: state,
                  child: SubCategoriesScreen(
                    categoryId: data['categoryId'] ?? '',
                    categoryName: data['categoryName'] ?? '',
                  ),
                );
              }),
          GoRoute(
            path: PageRouteName.productsList,
            pageBuilder: (_, GoRouterState state) {
              var data = state.extra as Map<String, dynamic>;
              return getCustomTransitionPage(
                state: state,
                child: ProductsScreen(
                    title: data['title'] ?? '',
                    categoryId: data['categoryId'] ?? ''),
              );
            },
          ),
        ],
      ),
      GoRoute(
          path: PageRouteName.productDetails,
          pageBuilder: (_, GoRouterState state) {
            final productId = state.extra as String;
            return getCustomTransitionPage(
              state: state,
              child: ProductDetailsScreen(
                productId: productId,
              ),
            );
          }),
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
      GoRoute(
          path: PageRouteName.shippingAddress,
          name: PageRouteName.shippingAddress,
          pageBuilder: (_, GoRouterState state) {
            return getCustomTransitionPage(
              state: state,
              child: BlocProvider(
                create: (context) => getIt<ProfileBloc>(),
                child: const ShippingAddressPage(),
              ), // Replace with actual ShippingAddressPage
            );
          }),
      GoRoute(
          path: PageRouteName.paymentMethod,
          pageBuilder: (_, GoRouterState state) {
            return getCustomTransitionPage(
              state: state,
              child: const Placeholder(),
            );
          }),
      GoRoute(
          path: PageRouteName.payment,
          name: PageRouteName.payment,
          pageBuilder: (_, GoRouterState state) {
            var data = state.extra as Map<String, dynamic>;
            /* final price = state.extra as double; //
            final onPaymentSuccess = state.extra as void Function();
            final onPaymentError = state.extra as void Function(); */
            return getCustomTransitionPage(
              state: state,
              child: PaymentView(
                onPaymentError: data['onPaymentError'] as void Function(),
                onPaymentSuccess: data['onPaymentSuccess'] as void Function(),
                price: data['price']
                    as double, // The extra data is of type double, not int.
              ),
            );
          }),
      GoRoute(
          path: PageRouteName.orderHistory,
          pageBuilder: (_, GoRouterState state) {
            return getCustomTransitionPage(
              state: state,
              child: const Placeholder(),
            );
          }),
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
