import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerWidget extends StatelessWidget {
  final String text;
  final Color color;
  const ContainerWidget({super.key, required this.text , required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.5.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        text,
        style: Styles().getOverlineSemiBoldStyle(
            color: Theme.of(context).scaffoldBackgroundColor),
      ),
    );
  }
}
