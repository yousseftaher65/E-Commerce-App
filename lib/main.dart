import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_pojo/bloc_observer.dart';
import 'package:ecommerce_pojo/config/routes/app_router.dart';
import 'package:ecommerce_pojo/config/themes/base_theme.dart';
import 'package:ecommerce_pojo/config/themes/dark_theme.dart';
import 'package:ecommerce_pojo/config/themes/light_theme.dart';
import 'package:ecommerce_pojo/core/helpers/check_internet_connection.dart';
import 'package:ecommerce_pojo/core/helpers/shared_preference.dart';
import 'package:ecommerce_pojo/core/utils/app_colors.dart';
import 'package:ecommerce_pojo/di.dart';
import 'package:ecommerce_pojo/features/shared/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SharedPreferenceHelper.init();
  CheckInternetConnection().init();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  bool initialIsDarkMode = SharedPreferenceHelper.getBool('isDarkMode') ?? false;
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(initialIsDarkMode),
      child: EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        fallbackLocale: const Locale('en'),
        child: QuickMartApp(),
      ),
    ),
  );
}

class QuickMartApp extends StatelessWidget {
  QuickMartApp({super.key});

  final BaseTheme lightTheme = LightTheme();

  final BaseTheme darkTheme = DarkTheme();

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => GlobalLoaderOverlay(
        overlayColor: Colors.black.withOpacity(0.5),
        overlayWidgetBuilder: (progress) {
          return Center(
            child: CircularProgressIndicator(
              value: progress,
              color: AppColors.cyan,
            ),
          );
        },
        child: MaterialApp.router(
          routerConfig: GoRouterConfig.router,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: lightTheme.themeData,
          darkTheme: darkTheme.themeData,
          themeMode: themeProvider.themeMode,
        ),
      ),
    );
  }
}
