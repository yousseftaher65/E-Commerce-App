import 'package:ecommerce_pojo/config/routes/page_route_name.dart';
import 'package:ecommerce_pojo/core/utils/app_strings.dart';
import 'package:ecommerce_pojo/core/utils/assets.gen.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:ecommerce_pojo/features/shared/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User Name",
                        style: Styles().getButton2Style(
                            color: Theme.of(context).scaffoldBackgroundColor),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        "ahmedraza@gmail.com",
                        style: Styles().getCaptionSemiBoldStyle(
                            color: Theme.of(context).scaffoldBackgroundColor),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      Assets.icons.logout.path,
                      height: 32.h,
                      width: 32.w,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 21.h),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 16.w,
                      ),
                      child: Text(
                        AppStrings.personal,
                        style: Styles().getCaptionSemiBoldStyle(
                            color: Theme.of(context).cardColor),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    ListTile(
                      leading: Image.asset(
                        Assets.icons.shipping1.path,
                        color: Theme.of(context).hoverColor,
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.shippingAddress,
                            style: Styles().getBody2MeduimStyle(
                                color: Theme.of(context).hoverColor),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.w,
                            color: Theme.of(context).hoverColor,
                          ),
                        ],
                      ),
                      onTap: () {
                        context.pushNamed(PageRouteName.shippingAddress);
                      },
                    ),
                    ListTile(
                      leading: Image.asset(
                        Assets.icons.payment1.path,
                        color: Theme.of(context).hoverColor,
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.paymentMethod,
                            style: Styles().getBody2MeduimStyle(
                                color: Theme.of(context).hoverColor),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.w,
                            color: Theme.of(context).hoverColor,
                          ),
                        ],
                      ),
                      onTap: () {
                        // Navigate to profile page
                      },
                    ),
                    ListTile(
                      leading: Image.asset(
                        Assets.icons.order.path,
                        color: Theme.of(context).hoverColor,
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.orderHistory,
                            style: Styles().getBody2MeduimStyle(
                                color: Theme.of(context).hoverColor),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.w,
                            color: Theme.of(context).hoverColor,
                          ),
                        ],
                      ),
                      onTap: () {
                        // Navigate to profile page
                      },
                    ),
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 16.w,
                      ),
                      child: Text(
                        AppStrings.support,
                        style: Styles().getCaptionSemiBoldStyle(
                            color: Theme.of(context).cardColor),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    ListTile(
                      leading: Image.asset(
                        Assets.icons.privacy.path,
                        color: Theme.of(context).hoverColor,
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.privacy,
                            style: Styles().getBody2MeduimStyle(
                                color: Theme.of(context).hoverColor),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.w,
                            color: Theme.of(context).hoverColor,
                          ),
                        ],
                      ),
                      onTap: () {
                        // Navigate to profile page
                      },
                    ),
                    ListTile(
                      leading: Image.asset(
                        Assets.icons.terms.path,
                        color: Theme.of(context).hoverColor,
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.terms,
                            style: Styles().getBody2MeduimStyle(
                                color: Theme.of(context).hoverColor),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.w,
                            color: Theme.of(context).hoverColor,
                          ),
                        ],
                      ),
                      onTap: () {
                        // Navigate to profile page
                      },
                    ),
                    ListTile(
                      leading: Image.asset(
                        Assets.icons.question.path,
                        color: Theme.of(context).hoverColor,
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.question,
                            style: Styles().getBody2MeduimStyle(
                                color: Theme.of(context).hoverColor),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.w,
                            color: Theme.of(context).hoverColor,
                          ),
                        ],
                      ),
                      onTap: () {
                        // Navigate to profile page
                      },
                    ),
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 16.w,
                      ),
                      child: Text(
                        AppStrings.account,
                        style: Styles().getCaptionSemiBoldStyle(
                            color: Theme.of(context).cardColor),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    ListTile(
                      leading: Image.asset(
                        Assets.icons.lock.path,
                        color: Theme.of(context).hoverColor,
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.changePassword,
                            style: Styles().getBody2MeduimStyle(
                                color: Theme.of(context).hoverColor),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.w,
                            color: Theme.of(context).hoverColor,
                          ),
                        ],
                      ),
                      onTap: () {
                        // Handle logout
                      },
                    ),
                    ListTile(
                      leading: Image.asset(
                        Assets.icons.theme.path,
                        color: Theme.of(context).hoverColor,
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.darkTheme,
                            style: Styles().getBody2MeduimStyle(
                                color: Theme.of(context).hoverColor),
                          ),
                          Switch(
                            activeColor: Theme.of(context).primaryColor,
                            inactiveTrackColor: Theme.of(context).hoverColor,
                            inactiveThumbColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            activeTrackColor: Theme.of(context).hoverColor,
                            value: provider.themeMode == ThemeMode.dark,
                            onChanged: (value) {
                              provider.changeTheme(
                                value ? ThemeMode.dark : ThemeMode.light,
                              );
                            },
                          ),
                        ],
                      ),
                      // Optionally, you can toggle the switch when the tile is tapped:
                      onTap: () {
                        /*  provider
                              .changeTheme(!(provider.themeMode == ThemeMode.dark)); */
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
