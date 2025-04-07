import 'package:ecommerce_pojo/core/utils/app_colors.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingWidget extends StatelessWidget {
  final num ratingsAverage;
  final int ratingsQuantity;
  const RatingWidget({super.key , required this.ratingsAverage, required this.ratingsQuantity});

  @override
  Widget build(BuildContext context) {
    // Calculate the number of full stars, half stars, and empty stars
    int fullStars = ratingsAverage.floor(); // Number of full stars
    bool hasHalfStar =
        (ratingsAverage - fullStars) >= 0.5; // Check for half star
    int emptyStars =
        5 - fullStars - (hasHalfStar ? 1 : 0); // Remaining empty stars
    return Row(
      children: [
        // Full stars
        for (int i = 0; i < fullStars; i++)
          Icon(Icons.star, color: AppColors.orange2, size: 20.sp),

        // Half star (if applicable)
        if (hasHalfStar)
          Icon(Icons.star_half, color: AppColors.orange2, size: 20.sp),

        // Empty stars
        for (int i = 0; i < emptyStars; i++)
          Icon(Icons.star_border, color: AppColors.orange2, size: 20.sp),
        SizedBox(width: 2.w),
        Text(
          '$ratingsAverage ($ratingsQuantity reviews)',
          style: Styles()
              .getOverlineSemiBoldStyle(color: Theme.of(context).cardColor)
              .copyWith(letterSpacing: 0.sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
