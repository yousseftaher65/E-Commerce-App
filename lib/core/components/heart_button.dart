import 'package:ecommerce_pojo/core/utils/app_colors.dart';
import 'package:ecommerce_pojo/core/utils/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeartButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isSelected;
  final double size;
  const HeartButton({super.key, this.onTap, this.isSelected = false , required this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(6.sp),
        width: size.w,
        height: size.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).cardColor,
        ),
        child: !isSelected
            ? Image.asset(
                Assets.icons.wishlist1.path,
                color: Theme.of(context).scaffoldBackgroundColor,
              )
            : Image.asset(
                Assets.icons.wishlist2.path,
                color: AppColors.red,
              ),
      ),
    );
  }
}
