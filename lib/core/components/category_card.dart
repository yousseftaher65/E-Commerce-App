import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String image;
  final double height;
  final double width;
  final double imageHeight;
  const CategoryCard({super.key, required this.image , required this.title , required this.height ,
      required this.width , required this.imageHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Theme.of(context).indicatorColor, width: 1.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
             image,
            height: imageHeight.h,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 2.h,),
          Text(
            title, style: Styles().getCaptionSemiBoldStyle(color: Theme.of(context).cardColor),)
        ],
      ),
    );
  }
}
