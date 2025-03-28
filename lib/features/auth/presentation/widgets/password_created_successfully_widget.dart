import 'package:ecommerce_pojo/config/routes/page_route_name.dart';
import 'package:ecommerce_pojo/core/components/custom_elevated_button.dart';
import 'package:ecommerce_pojo/core/utils/app_strings.dart';
import 'package:ecommerce_pojo/core/utils/assets.gen.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PasswordCreatedSuccessfullyWidget extends StatelessWidget {
  const PasswordCreatedSuccessfullyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.images.resetPassword.path,
              fit: BoxFit.fill,
              height: 301.h,
              width: 245.w,
            ),
            SizedBox(
              height: 77.h,
            ),
            Text(
              AppStrings.passwordCreatedSuccessfully,
              textAlign: TextAlign.center,
              style: Styles()
                  .getHeadline2BoldStyle(color: Theme.of(context).cardColor,),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              AppStrings.passwordCreatedSuccessfullyContent,
              style: Styles()
                  .getBody2RegularStyle(color: Theme.of(context).hoverColor),
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomElevatedButton(
                onPressed: () {
                  context.go(PageRouteName.login);
                },
                text: AppStrings.login)
          ],
        ),
      ),
    );
  }
}
