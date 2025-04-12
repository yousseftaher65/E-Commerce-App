import 'package:ecommerce_pojo/config/routes/page_route_name.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubCategoryCard extends StatelessWidget {
  final String? image;
  final String? title;
  const SubCategoryCard({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(PageRouteName.productsList, extra: title);
      },
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title ?? '',
              style:
                  Styles().getHeadline3BoldStyle(color: Theme.of(context).cardColor) , textAlign: TextAlign.center,
              //.copyWith(overflow: TextOverflow.ellipsis),
              ),
        ],
      ),
       /* SizedBox(
        height: 167.h,
        width: 160.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /* ClipRRect(
              borderRadius: BorderRadius.circular(24.r),
              child: Image.asset(
                image ?? '',
                height: 138.h,
                width: 160.w,
                fit: BoxFit.cover,
                /*  placeholder: (context, url) => Skeletonizer(
                  enabled: true,
                  child: Skeleton.leaf(
                    child: Container(color: Colors.grey[300]),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error), */
              ),
            ), */
            Text(
              title ?? '',
              style: Styles()
                  .getHeadline3BoldStyle(color: Theme.of(context).cardColor)
                  //.copyWith(overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ), */
    );
  }
}
