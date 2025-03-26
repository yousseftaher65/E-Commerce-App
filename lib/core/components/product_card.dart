import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_pojo/core/components/heart_button.dart';
import 'package:ecommerce_pojo/core/utils/app_colors.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatefulWidget {
  final String? image;
  final String? title;
  final String? price;
  final String? oldPrice;
  final int? colorsNum;
  final int? colorsListNum;
  final List<Color>? colors;
  const ProductCard({
    super.key,
    this.image,
    this.title,
    this.price,
    this.oldPrice,
    this.colorsNum,
    this.colorsListNum,
    this.colors,
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
    return SizedBox(
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
                CachedNetworkImage(
                  imageUrl: widget.image ?? '',
                  height: 138.h,
                  width: 160.w,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.cyan,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Container(
                  margin: EdgeInsets.only(top: 6.h, right: 6.w, left: 6.w),
                  child: HeartButton(
                    size: 24,
                    isSelected: favorited,
                    onTap: favorite,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              width: 60.w,
              height: 24.h,
              child: Stack(
                alignment: Alignment.center,
                children: List.generate(widget.colorsListNum ?? 0, (index) {
                  final bgColors = [
                    AppColors.brown,
                    AppColors.orange,
                    AppColors.black
                  ];
                  return Positioned(
                    left: index * 18.w, // Shift items to stack them correctly
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
                          color: bgColors[index], // Background color by index
                        ),
                      ),
                    ),
                  );
                }).reversed.toList(),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              'All ${widget.colorsNum ?? '0'} Colors',
              style: Styles()
                  .getOverlineRegularStyle(color: Theme.of(context).cardColor)
                  .copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: Theme.of(context).cardColor),
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
            '\$ ${widget.price ?? '00'} ',
            style: Styles()
                .getBody2MeduimStyle(color: Theme.of(context).cardColor),
          ),
          Text(
            '\$ ${widget.oldPrice ?? '00'}',
            style: Styles()
                .getBody2MeduimStyle(color: Theme.of(context).hintColor)
                .copyWith(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Theme.of(context).hintColor),
          ),
        ],
      ),
    );
  }
}
