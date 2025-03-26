// ignore_for_file: file_names

import 'package:ecommerce_pojo/config/routes/page_route_name.dart';
import 'package:ecommerce_pojo/core/components/custom_elevated_button.dart';
import 'package:ecommerce_pojo/core/utils/app_colors.dart';
import 'package:ecommerce_pojo/core/utils/app_strings.dart';
import 'package:ecommerce_pojo/core/utils/assets.gen.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:ecommerce_pojo/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<Map<String, String>> onboardingData = [
    {
      "image": Assets.images.onboarding1.path,
      "title": AppStrings.onBoardingTitle1,
      "description": AppStrings.onBoardingContent1,
    },
    {
      "image": Assets.images.onboarding2.path,
      "title": AppStrings.onBoardingTitle2,
      "description": AppStrings.onBoardingContent2,
    },
    {
      "image": Assets.images.onboarding3.path,
      "title": AppStrings.onBoardingTitle3,
      "description": AppStrings.onBoardingContent3,
    },
  ];

  final PageController pageController = PageController();
  int currentPage = 0;

  void nextPage() {
    pageController.nextPage(
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 500),
    );
  }

  void previousPage() {
    pageController.previousPage(
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      int newIndex = pageController.page?.round() ?? 0;
      if (newIndex != currentPage) {
        setState(() {
          currentPage = newIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: currentPage > 0
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: GestureDetector(
                  onTap: previousPage,
                  child: Image.asset(
                    Assets.icons.arrowBack2.path,
                    color: Theme.of(context).cardColor,
                    height: 32.h,
                    width: 32.w,
                  ),
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Theme.of(context).brightness == Brightness.dark
                    ? Image.asset(
                        Assets.logos.appLogoDark.path,
                        height: 32.h,
                        width: 104.w,
                      )
                    : Image.asset(
                        Assets.logos.appLogoLight.path,
                        height: 32.h,
                        width: 104.w,
                      ),
              ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: TextButton(
              onPressed: () {
                pageController.jumpToPage(onboardingData.length - 1);
              },
              child: Text(
                AppStrings.skip,
                style: Styles()
                    .getBody2MeduimStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => OnboardingBloc(),
        child: BlocConsumer<OnboardingBloc, OnboardingState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 8,
                    child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      controller: pageController,
                      itemCount: onboardingData.length,
                      itemBuilder: (context, index) {
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          transitionBuilder: (child, animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          child: Column(
                            key: ValueKey<int>(index),
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Spacer(),
                              Image.asset(
                                onboardingData[index]["image"]!,
                                fit: BoxFit.cover,
                                height: 240.h,
                                width: 240.w,
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 284.w,
                                child: Text(
                                  onboardingData[index]["title"]!,
                                  style: Styles().getHeadline2BoldStyle(
                                    color: Theme.of(context).cardColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 16.h),
                              SizedBox(
                                width: 328.w,
                                child: Text(
                                  onboardingData[index]["description"]!,
                                  style: Styles().getBody2RegularStyle(
                                      color: Theme.of(context).hoverColor),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 24.h),
                  currentPage == onboardingData.length - 1
                      ? SizedBox(
                          height: 60.h,
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<OnboardingBloc>()
                                        .add(OnboardingComplete());
                                    context.go(PageRouteName.login);
                                  },
                                  text: AppStrings.login,
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  textColor: Theme.of(context).cardColor,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: CustomElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<OnboardingBloc>()
                                        .add(OnboardingComplete());
                                    context.go(PageRouteName.signup);
                                  },
                                  text: AppStrings.getStarted,
                                  icon: Assets.icons.arrowForward.path,
                                ),
                              ),
                            ],
                          ),
                        )
                      : CustomElevatedButton(
                          onPressed: () {
                            nextPage();
                          },
                          text: AppStrings.next,
                        ),
                  SizedBox(height: 24.h),
                  Container(
                    padding: EdgeInsets.all(5.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: onboardingData.length,
                      effect: WormEffect(
                        dotHeight: 6.h,
                        dotWidth: 6.w,
                        dotColor: Theme.of(context).hintColor,
                        activeDotColor: AppColors.green,
                        type: WormType.thinUnderground,
                      ),
                    ),
                  ),
                  const Spacer()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
