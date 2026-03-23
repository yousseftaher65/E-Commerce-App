import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:ecommerce_pojo/config/routes/page_route_name.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String image;
  final double height;
  final double width;
  final String categoryId;
  const CategoryCard({
    super.key,
    required this.image,
    required this.title,
    required this.height,
    required this.width,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(PageRouteName.subCategories,
            extra: {"categoryName": title, "categoryId": categoryId});
      },
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: height.h,
            width: width.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                  color: Theme.of(context).indicatorColor, width: 1.w),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.fill,
                height: height.h,
                width: width.w,
                placeholder: (context, url) => Skeletonizer(
                  enabled: true,
                  child: Skeleton.leaf(
                    child: Container(color: Colors.grey[300]),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Styles()
                .getCaptionSemiBoldStyle(color: Theme.of(context).cardColor),
          )
        ],
      ),
    );
  }
}
