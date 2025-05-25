import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_pojo/config/routes/page_route_name.dart';
import 'package:ecommerce_pojo/core/components/product_counter.dart';
import 'package:ecommerce_pojo/core/utils/app_colors.dart';
import 'package:ecommerce_pojo/core/utils/assets.gen.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartProductCard extends StatefulWidget {
  final VoidCallback onDelete;
  final VoidCallback onTap;
  final String? imagePath;
  final String? productName;
  final String? productPrice;
  final String? productOldPrice;
  final String? productId;
  final int? count;
  final ValueChanged<bool>? onCheckboxChanged;
  const CartProductCard(
      {super.key,
      this.imagePath,
      this.productName,
      this.productPrice,
      this.productOldPrice,
      this.productId,
      this.count,
      required this.onDelete,
      required this.onTap,
      this.onCheckboxChanged});

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  late int counter;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    counter = widget.count ?? 1;
  }

  void incrementCounter(int value) {
    if (counter >= 10) return;
    setState(() {
      counter++;
    });
  }

  void decrementCounter(int value) {
    if (counter <= 1) return;
    setState(() {
      if (counter > 1) counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: Row(
        children: [
          GestureDetector(
            onTap: widget.onTap,
            /*  onTap: () {
              context.push(PageRouteName.productDetails,
                  extra: widget.productId ?? '');
            }, */
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Skeleton.replace(
                child: CachedNetworkImage(
                  imageUrl: widget.imagePath ?? "",
                  width: 120.w,
                  height: 120.h,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Skeletonizer(
                    enabled: true,
                    child: Skeleton.leaf(
                      child: Container(color: Colors.grey[300]),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    context.push(PageRouteName.productDetails,
                        extra: widget.productId ?? '');
                  },
                  child: Text(
                    widget.productName ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles().getBody2MeduimStyle(
                        color: Theme.of(context).cardColor),
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Text(
                  "\$${widget.productPrice}",
                  style: Styles().getCaptionSemiBoldStyle(
                      color: Theme.of(context).cardColor),
                ),
                /*  SizedBox(
                          height: 2.h,
                        ), */
                Text(
                  widget.productOldPrice != null
                      ? "\$${widget.productOldPrice}"
                      : "",
                  style: Styles()
                      .getOverlineRegularStyle(
                          color: Theme.of(context).hoverColor)
                      .copyWith(
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Theme.of(context).hoverColor,
                      ),
                ),
                const Spacer(),
                ProductCounter(
                    counter: counter,
                    add: incrementCounter,
                    remove: decrementCounter),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (widget.onCheckboxChanged != null) ...[
                Checkbox(
                    activeColor: AppColors.cyan,
                    checkColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                      widget.onCheckboxChanged!(isChecked);
                    }),
                const Spacer()
              ],
              GestureDetector(
                onTap: () {
                  widget.onDelete();
                },
                child: Image.asset(
                  Assets.icons.delete.path,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
