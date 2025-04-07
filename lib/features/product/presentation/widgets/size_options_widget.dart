import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeOptionsWidget extends StatefulWidget {
  const SizeOptionsWidget({super.key});

  @override
  State<SizeOptionsWidget> createState() => _ColorOptionState();
}

class _ColorOptionState extends State<SizeOptionsWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 32.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(
                    width: 4.w,
                  ),
              itemCount: sizes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == selectedIndex
                          ? Theme.of(context).cardColor
                          : Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        sizes[index],
                        style: Styles().getOverlineSemiBoldStyle(
                            color: index == selectedIndex ? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).cardColor),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}

List<String> sizes = [
  'XS',
  'S',
  'M',
  'L',
  'XL',
];

/* const Row(
                    children: [
                      ColorOption(AppColors.black),
                      ColorOption(AppColors.blue),
                      ColorOption(AppColors.purpel),
                      ColorOption(AppColors.orange),
                      ColorOption(AppColors.green),
                    ],
                  ), */