import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_pojo/core/utils/assets.gen.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final List<String> banners = [
    Assets.images.banner.path,
    Assets.images.banner.path,
    Assets.images.banner.path,
    Assets.images.banner.path,
    Assets.images.banner.path,
  ];

  int _currentBanner = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328.w,
      height: 148.h,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          // Carousel inside the card
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: CarouselSlider(
              carouselController: _carouselController,
              items: banners
                  .map((bannerPath) => Image.asset(
                        bannerPath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 148.h,
                      ))
                  .toList(),
              options: CarouselOptions(
                height: 148.h,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                viewportFraction: 1.0,
                enlargeCenterPage: false, // Important!
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentBanner = index;
                  });
                },
              ),
            ),
          ),
          // Indicator
          Positioned(
            right: 16.w,
            bottom: 12.h,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: Theme.of(context).indicatorColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: AnimatedSmoothIndicator(
                activeIndex: _currentBanner,
                count: banners.length,
                effect: WormEffect(
                  dotHeight: 6.h,
                  dotWidth: 6.w,
                  dotColor: Theme.of(context).hintColor,
                  activeDotColor: Theme.of(context).primaryColor,
                  type: WormType.thinUnderground,
                ),
                onDotClicked: (index) {
                  _carouselController.animateToPage(index);
                },
              ),
            ),
          ),
          // Promo text (optional)
          Positioned(
            left: 16.w,
            bottom: 12.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    '30% OFF',
                    style: Styles().getOverlineSemiBoldStyle(
                        color: Theme.of(context).scaffoldBackgroundColor),
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  "On Headphones",
                  style: Styles().getCaptionRegularStyle(
                      color: Theme.of(context).scaffoldBackgroundColor),
                ),
                Text(
                  "Exclusive Sales",
                  style: Styles().getHeadline2SemiBoldStyle(
                      color: Theme.of(context).scaffoldBackgroundColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
