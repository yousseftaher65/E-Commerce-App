import 'package:flutter/material.dart';

abstract class BaseTheme {
  Color get primaryColor;
  Color get secondryColor;
  Color get accentColor;
  Color get blackColor;
  Color get whiteColor;
  Color get buttonColor;
  Color get textColor;
  Color get supTextColor;
  Color get hintTextColor;

  ThemeData get themeData;
}