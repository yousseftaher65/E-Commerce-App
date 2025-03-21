import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_pojo/config/routes/app_router.dart';
import 'package:ecommerce_pojo/config/themes/base_theme.dart';
import 'package:ecommerce_pojo/config/themes/dark_theme.dart';
import 'package:ecommerce_pojo/config/themes/light_theme.dart';
import 'package:ecommerce_pojo/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  configureDependencies();
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      fallbackLocale: const Locale('en'),
      child: const QuickMartApp(),
    ),
  );
}

class QuickMartApp extends StatefulWidget {
  const QuickMartApp({super.key});

  @override
  State<QuickMartApp> createState() => _QuickMartAppState();
}

class _QuickMartAppState extends State<QuickMartApp> {

  final BaseTheme lightTheme = LightTheme();
  final BaseTheme darkTheme = DarkTheme();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp.router(
        routerConfig: GoRouterConfig.router,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: lightTheme.themeData,
        darkTheme: darkTheme.themeData,
        themeMode: ThemeMode.light /* state ?  :  ThemeMode.light*/,     
      ),
    );
  }
}
