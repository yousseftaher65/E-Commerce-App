import 'package:ecommerce_pojo/core/components/custom_elevated_button.dart';
import 'package:ecommerce_pojo/core/components/custom_text_field.dart';
import 'package:ecommerce_pojo/core/utils/app_strings.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class VoucherCodeWidget extends StatelessWidget {
  const VoucherCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
      decoration: BoxDecoration(
      color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.voucherCode,
            style: Styles()
                .getBody1RegularStyle(color: Theme.of(context).cardColor),
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            hint: AppStrings.voucherCode,
          ),
          SizedBox(height: 16.h),
          CustomElevatedButton(
            text: AppStrings.apply,
            onPressed: () {
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}
