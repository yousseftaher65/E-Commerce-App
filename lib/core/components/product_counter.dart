import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCounter extends StatelessWidget {
  final int counter;
  final void Function(int) add;
  final void Function(int) remove;
  const ProductCounter(
      {super.key,
      required this.counter,
      required this.add,
      required this.remove});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96.w,
      height: 32.h,
      padding: EdgeInsets.all(4.sp),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Theme.of(context).indicatorColor, width: 1.w),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () => remove(counter),
            child: Icon(
              Icons.remove_rounded,
              color: counter > 0 ? Theme.of(context).cardColor : Theme.of(context).hintColor,
              size: 24.sp,
            ),
          ),
          const Spacer(),
          Text(
            counter.toString(),
            style: Styles()
                .getBody1MeduimStyle(color:  Theme.of(context).cardColor),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
               add(counter);
               
            },
            child: Icon(
              Icons.add_rounded,
              color: counter >= 10 ? Theme.of(context).hintColor : Theme.of(context).cardColor,
              size: 24.sp,
            ),
          ),
        ],
      ),
    );
  }
}
