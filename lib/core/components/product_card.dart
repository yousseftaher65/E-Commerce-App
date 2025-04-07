import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_pojo/config/routes/page_route_name.dart';
import 'package:ecommerce_pojo/core/components/heart_button.dart';
import 'package:ecommerce_pojo/core/utils/app_colors.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductCard extends StatefulWidget {
  final String? image;
  final String? title;
  final String? price;
  final String? oldPrice;
  final int? colorsNum;
  final int? colorsListNum;
  final List<Color>? colors;
  final String? productId;
  final bool enableSekelton;
  const ProductCard({
    super.key,
    this.image,
    this.title,
    this.price,
    this.oldPrice,
    this.colorsNum,
    this.colorsListNum,
    this.colors,
    this.productId,
    this.enableSekelton = false,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int selectedIndex = 0;
  bool favorited = false;

  void favorite() {
    setState(() {
      favorited = !favorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(PageRouteName.productDetails, extra: widget.productId ?? '');
      },
      child: Skeletonizer(
        enableSwitchAnimation: true,
        enabled: widget.enableSekelton,
        child: SizedBox(
          width: 160.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24.r),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Skeleton.replace(
                      height: 138.h,
                      width: 160.w,
                      child: CachedNetworkImage(
                        imageUrl: widget.image ?? '',
                        height: 138.h,
                        width: 160.w,
                        fit: BoxFit.fitWidth,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6.h, right: 6.w, left: 6.w),
                      child: Skeleton.replace(
                        height: 24.h,
                        width: 24.w,
                        child: HeartButton(
                          size: 24,
                          isSelected: favorited,
                          onTap: favorite,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Skeleton.replace(
                  height: 24.h,
                  width: 60.w,
                  child: SizedBox(
                    width: 60.w,
                    height: 24.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children:
                          List.generate(widget.colorsListNum ?? 0, (index) {
                        final bgColors = widget.colors ??
                            [
                              AppColors.brown,
                              AppColors.orange,
                              AppColors.black
                            ];
                        return Positioned(
                          left: index *
                              18.w, // Shift items to stack them correctly
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              width: 24.w,
                              height: 24.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: index == selectedIndex
                                      ? AppColors.blue
                                      : Colors.transparent,
                                  width: 2.w,
                                ),
                                shape: BoxShape.circle,
                                color: bgColors[
                                    index], // Background color by index
                              ),
                            ),
                          ),
                        );
                      }).reversed.toList(),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  'All ${widget.colorsNum ?? '0'} Colors',
                  style: Styles()
                      .getOverlineRegularStyle(
                          color: Theme.of(context).cardColor)
                      .copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: Theme.of(context).cardColor,
                          letterSpacing: 1.5.sp),
                ),
              ]),
              SizedBox(
                height: 8.h,
              ),
              Text(
                widget.title ?? '',
                style: Styles()
                    .getBody2MeduimStyle(color: Theme.of(context).cardColor)
                    .copyWith(overflow: TextOverflow.ellipsis),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                widget.price ?? '00',
                style: Styles().getCaptionSemiBoldStyle(
                    color: Theme.of(context).cardColor),
              ),
              Text(
                widget.oldPrice ?? '00',
                style: Styles()
                    .getOverlineRegularStyle(color: Theme.of(context).hintColor)
                    .copyWith(
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Theme.of(context).hintColor,
                        letterSpacing: 1.5.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
