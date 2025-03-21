import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final String? icon;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
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
                    Image.asset(icon ?? '' , color: Theme.of(context).scaffoldBackgroundColor,),
                    //Image.asset(),
                  ],
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
