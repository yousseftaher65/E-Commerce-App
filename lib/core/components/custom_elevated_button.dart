import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final String? icon;
  final Color? iconColor;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
         shape: RoundedRectangleBorder(
          side: backgroundColor == null ? BorderSide.none : BorderSide(color: Theme.of(context).indicatorColor , width: 1.w),
          borderRadius: BorderRadius.circular(12.r),
        ),
        backgroundColor: backgroundColor,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text , style: Styles().getButton2Style(color: textColor ?? Theme.of(context).scaffoldBackgroundColor),),
          icon != null
              ? Row(
                  children: [
                    SizedBox(width: 8.w),
                    Image.asset(icon ?? '' , color: iconColor ?? Theme.of(context).scaffoldBackgroundColor, height: 24.h, width: 24.w,),
                  ],
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
