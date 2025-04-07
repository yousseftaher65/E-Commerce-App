import 'package:ecommerce_pojo/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorOption extends StatefulWidget {
  const ColorOption({super.key});

  @override
  State<ColorOption> createState() => _ColorOptionState();
}

class _ColorOptionState extends State<ColorOption> {
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
              itemCount: colors.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    width: 32.w,
                    height: 32.h,
                    foregroundDecoration: BoxDecoration(
                      color: colors[index],
                      shape: BoxShape.circle,
                      border: index == selectedIndex
                          ? Border.all(color: AppColors.blue, width: 3.w)
                          : null,
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}

List<Color> colors = [
  AppColors.black,
  AppColors.blue,
  AppColors.purpel,
  AppColors.orange,
  AppColors.green
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