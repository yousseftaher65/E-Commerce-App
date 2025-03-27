import 'package:animate_do/animate_do.dart';
import 'package:ecommerce_pojo/config/routes/page_route_name.dart';
import 'package:ecommerce_pojo/core/components/custom_elevated_button.dart';
import 'package:ecommerce_pojo/core/utils/app_strings.dart';
import 'package:ecommerce_pojo/core/utils/assets.gen.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:ecommerce_pojo/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashBloc splashBloc;

  @override
  void initState() {
    super.initState();
    splashBloc = SplashBloc()..add(CheckInternetConnectionEvent());
  }

  @override
  void dispose() {
    splashBloc.close(); // Clean up the BLoC
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: splashBloc,
      child: BlocConsumer<SplashBloc, SplashState>(
          listenWhen: (previous, current) =>
              current is NoInternetState || current is SplashLoadedState,
          listener: (context, state) {
            if (state is NoInternetState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 3),
                  backgroundColor: Theme.of(context).cardColor,
                  content: Text(
                    AppStrings.noInternetConnection,
                    style: Styles().getBody2MeduimStyle(
                        color: Theme.of(context).scaffoldBackgroundColor),
                  ),
                ),
              );
            } else if (state is SplashLoadedState) {
              if (context.mounted) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Future.delayed(const Duration(milliseconds: 1750), () {
                    if (context.mounted) {
                      state.isFirstTime
                          ? context.go(PageRouteName.login)
                          : context.go(PageRouteName.onboarding);
                    }
                  });
                });
              }
            }
          },
          buildWhen: (previous, current) =>
              current is NoInternetState || current is SplashLoadedState,
          builder: (context, state) {
            if (state is NoInternetState) {
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.wifi_off, size: 50.sp),
                      SizedBox(height: 16.h),
                      Text(
                        AppStrings.noInternetConnection,
                        style: Styles().getBody1MeduimStyle(
                            color: Theme.of(context).cardColor),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        width: 200.w,
                        child: CustomElevatedButton(
                          onPressed: () {
                            context
                                .read<SplashBloc>()
                                .add(CheckInternetConnectionEvent());
                          },
                          text: AppStrings.retry,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: FadeIn(
                      duration: const Duration(milliseconds: 1750),
                      child: Image.asset(
                        Theme.of(context).brightness == Brightness.dark
                            ? Assets.logos.appLogoDark.path
                            : Assets.logos.appLogoLight.path,
                        height: 76.h,
                        width: 264.w,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
