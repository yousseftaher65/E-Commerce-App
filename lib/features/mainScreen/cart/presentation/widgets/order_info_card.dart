import 'package:ecommerce_pojo/core/utils/app_strings.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderInfoCard extends StatelessWidget {
  final String? totalCartPrice;
  const OrderInfoCard({super.key, required this.totalCartPrice});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 11.0.h),
            child: Text(
              AppStrings.orderInfo,
              style: Styles()
                  .getBody1MeduimStyle(color: Theme.of(context).cardColor),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.subTotal,
                  style: Styles().getCaptionRegularStyle(
                      color: Theme.of(context).hoverColor),
                ),
                Text(
                  '\$0.00',
                  style: Styles().getCaptionRegularStyle(
                      color: Theme.of(context).hoverColor),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.shippingCost,
                  style: Styles().getCaptionRegularStyle(
                      color: Theme.of(context).hoverColor),
                ),
                Text(
                  '\$0.00',
                  style: Styles().getCaptionRegularStyle(
                      color: Theme.of(context).hoverColor),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.total,
                  style: Styles()
                      .getBody1MeduimStyle(color: Theme.of(context).cardColor),
                ),
                Text(
                  '\$${totalCartPrice ?? '0.00'}',
                  style: Styles()
                      .getBody1MeduimStyle(color: Theme.of(context).cardColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
