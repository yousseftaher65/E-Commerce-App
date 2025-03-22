import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IndicatorsContainer extends StatefulWidget {
  final PageController controller;
  final int pagesCount;
  const IndicatorsContainer({super.key , required this.controller , required this.pagesCount});

  @override
  State<IndicatorsContainer> createState() => _IndicatorsContainerState();
}

class _IndicatorsContainerState extends State<IndicatorsContainer> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: Theme.of(context).indicatorColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: SmoothPageIndicator(
        controller: widget.controller,
        count: widget.pagesCount,
        effect: WormEffect(
          dotHeight: 6.h,
          dotWidth: 6.w,
          dotColor: Theme.of(context).hintColor,
          activeDotColor: Theme.of(context).primaryColor,
          type: WormType.thinUnderground,
        ),
        onDotClicked: (index) {
          setState(() {
            selectedIndex = index;
            widget.controller.jumpToPage(index);
          });
        },
      ),
    );
  }
}
