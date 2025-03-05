import 'package:ecommerce_pojo/core/utils/fonts_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles {
  TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color,
      {double height = 1, double letterSpacing = 0}) {
    return TextStyle(
        height: height.h,
        letterSpacing: letterSpacing.sp,
        fontSize: fontSize.sp,
        fontFamily: FontFamily.fontFamily,
        color: color,
        fontWeight: fontWeight);
  }

  TextStyle getHeadline1BoldStyle(
      {double fontSize = FontSize.s32,
      required Color color,
      double height = 1.20}) {
    return _getTextStyle(fontSize, FontWeightManager.bold, color,
        height: height);
  }

  TextStyle getHeadline2BoldStyle(
      {double fontSize = FontSize.s24,
      required Color color,
      double height = 1.20}) {
    return _getTextStyle(fontSize, FontWeightManager.bold, color,
        height: height);
  }

  TextStyle getHeadline3BoldStyle(
      {double fontSize = FontSize.s18,
      required Color color,
      double height = 1.20,
      double letterSpacing = 0.25}) {
    return _getTextStyle(fontSize, FontWeightManager.bold, color,
        height: height, letterSpacing: letterSpacing);
  }

  TextStyle getHeadline1SemiBoldStyle(
      {double fontSize = FontSize.s32,
      required Color color,
      double height = 1.20}) {
    return _getTextStyle(fontSize, FontWeightManager.semiBold, color,
        height: height);
  }

  TextStyle getHeadline2SemiBoldStyle(
      {double fontSize = FontSize.s24,
      required Color color,
      double height = 1.20}) {
    return _getTextStyle(fontSize, FontWeightManager.semiBold, color,
        height: height);
  }

  TextStyle getHeadline3SemiBoldStyle(
      {double fontSize = FontSize.s18,
      required Color color,
      double height = 1.20,
      double letterSpacing = 0.25}) {
    return _getTextStyle(fontSize, FontWeightManager.semiBold, color,
        height: height, letterSpacing: letterSpacing);
  }

  TextStyle getHeadline1RegularStyle(
      {double fontSize = FontSize.s32,
      required Color color,
      double height = 1.20}) {
    return _getTextStyle(fontSize, FontWeightManager.regular, color,
        height: height);
  }

  TextStyle getHeadline2RegularStyle(
      {double fontSize = FontSize.s24,
      required Color color,
      double height = 1.20}) {
    return _getTextStyle(fontSize, FontWeightManager.regular, color,
        height: height);
  }

  TextStyle getHeadline3RegularStyle(
      {double fontSize = FontSize.s18,
      required Color color,
      double height = 1.20,
      double letterSpacing = 0.25}) {
    return _getTextStyle(fontSize, FontWeightManager.regular, color,
        height: height, letterSpacing: letterSpacing);
  }

  TextStyle getButton1Style(
      {double fontSize = FontSize.s16, required Color color}) {
    return _getTextStyle(
      fontSize,
      FontWeightManager.semiBold,
      color,
    );
  }

  TextStyle getButton2Style({
    double fontSize = FontSize.s14,
    required Color color,
  }) {
    return _getTextStyle(
      fontSize,
      FontWeightManager.semiBold,
      color,
    );
  }

  TextStyle getBody1MeduimStyle(
      {double fontSize = FontSize.s16,
      required Color color,
      double height = 1.5,
      double letterSpacing = 0.25}) {
    return _getTextStyle(fontSize, FontWeightManager.medium, color,
        height: height, letterSpacing: letterSpacing);
  }

  TextStyle getBody1RegulerStyle(
      {double fontSize = FontSize.s16,
      required Color color,
      double height = 1.5,
      double letterSpacing = 0.25}) {
    return _getTextStyle(fontSize, FontWeightManager.regular, color,
        height: height, letterSpacing: letterSpacing);
  }

  TextStyle getBody2MeduimStyle(
      {double fontSize = FontSize.s14,
      required Color color,
      double height = 1.5,
      double letterSpacing = 0.25}) {
    return _getTextStyle(fontSize, FontWeightManager.medium, color,
        height: height, letterSpacing: letterSpacing);
  }

  TextStyle getBody2RegulerStyle(
      {double fontSize = FontSize.s14,
      required Color color,
      double height = 1.5,
      double letterSpacing = 0.25}) {
    return _getTextStyle(fontSize, FontWeightManager.regular, color,
        height: height, letterSpacing: letterSpacing);
  }

  TextStyle getCaptionSemiBoldStyle({
    double fontSize = FontSize.s12,
    required Color color,
  }) {
    return _getTextStyle(
      fontSize,
      FontWeightManager.semiBold,
      color,
    );
  }

  TextStyle getCaptionRegularStyle({
    double fontSize = FontSize.s12,
    required Color color,
  }) {
    return _getTextStyle(
      fontSize,
      FontWeightManager.regular,
      color,
    );
  }

  TextStyle getOverlineRegulerStyle({
    double fontSize = FontSize.s10,
    required Color color,
    double letterSpacing = 1.5,
  }) {
    return _getTextStyle(fontSize, FontWeightManager.regular, color,
        letterSpacing: letterSpacing);
  }

  TextStyle getOverlineSemiBoldStyle({
    double fontSize = FontSize.s10,
    required Color color,
    double letterSpacing = 1.5,
  }) {
    return _getTextStyle(fontSize, FontWeightManager.regular, color,
        letterSpacing: letterSpacing);
  }
}
