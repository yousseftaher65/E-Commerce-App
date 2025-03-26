import 'package:ecommerce_pojo/core/utils/assets.gen.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToastConstants {
  static double width = 328.w;
  static double height = 46.h;
  static double spacing = 8.w;
  static double padding = 16.sp;
  static double iconSize = 24.w;
}

class CustomToast {
  static OverlayEntry? _currentOverlay;

  static void show(
    {required BuildContext context,
    required String message,
    String? imagePath,
    String? clickableText,
    VoidCallback? onClick,}) {
    _currentOverlay?.remove();

    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              width: ToastConstants.width,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Theme.of(context).indicatorColor, width: 1.w),
              ),
              child: Row(
                children: [
                  Image.asset(imagePath ?? Assets.icons.success.path,
                      width: ToastConstants.iconSize,
                      height: ToastConstants.iconSize),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: message,
                        style: Styles()
                            .getCaptionSemiBoldStyle(
                                color: Theme.of(context).cardColor)
                            .copyWith(overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ),
                  SizedBox(width: 32.w),
                  GestureDetector(
                    onTap: onClick,
                    child: RichText(
                      text: TextSpan(
                        text: clickableText ?? '',
                        style: Styles().getCaptionSemiBoldStyle(
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    _currentOverlay = overlayEntry;
    Overlay.of(context).insert(overlayEntry);

    Future.delayed(const Duration(seconds: 3), () {
      if (_currentOverlay == overlayEntry) {
        overlayEntry.remove();
        _currentOverlay = null;
      }
    });
  }
}
