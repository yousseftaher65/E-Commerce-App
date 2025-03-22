import 'package:ecommerce_pojo/config/themes/base_theme.dart';
import 'package:ecommerce_pojo/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LightTheme extends BaseTheme {
  @override
  Color get primaryColor => AppColors.cyan;

  @override
  Color get secondryColor => AppColors.cyanLight50;

  @override
  Color get accentColor => AppColors.grayLight50;

  @override
  Color get blackColor => AppColors.black;

  @override
  Color get whiteColor => AppColors.white;

  @override
  Color get buttonColor => primaryColor;

  @override
  Color get textColor => blackColor;

  @override
  Color get hintTextColor => AppColors.grayLight100;

  @override
  Color get subTextColor => AppColors.grayLight150;

  @override
  ThemeData get themeData => ThemeData(
        brightness: Brightness.light, 
        primaryColor: primaryColor,
        secondaryHeaderColor: secondryColor,
        indicatorColor: accentColor,
        scaffoldBackgroundColor: whiteColor,
        cardColor: blackColor,
        hintColor: hintTextColor,
        hoverColor: subTextColor,

        ///app bar theme
        appBarTheme: AppBarTheme(
          backgroundColor: whiteColor,
          surfaceTintColor: whiteColor,
        ),

        ///bottom nav bar
        bottomNavigationBarTheme:  BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          unselectedItemColor: subTextColor,
          backgroundColor: whiteColor,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          showSelectedLabels: true,
        ),

        ///elevated button
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: blackColor,
            padding:  EdgeInsets.symmetric(vertical: 21.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            textStyle: TextStyle(color: whiteColor)
          ),
        ),

        /// text field
        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: blackColor,
          suffixIconColor: blackColor,
          activeIndicatorBorder: BorderSide(color: blackColor),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide:  BorderSide(
              color: AppColors.red,
              width: 1.w,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide:  BorderSide(
             color: AppColors.red,
              width: 1.w,
            ),
          ),
          contentPadding:
               EdgeInsets.symmetric(vertical: 22.h, horizontal: 12.w),
          hintStyle: TextStyle(color: hintTextColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: accentColor,
              width: 1.w,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: primaryColor,
              width: 1.w,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: accentColor,
              width: 1.w,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: accentColor,
              width: 1.w,
            ),
          ),
        ),
      );
}
