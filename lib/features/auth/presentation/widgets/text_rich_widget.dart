import 'package:ecommerce_pojo/core/utils/app_colors.dart';
import 'package:ecommerce_pojo/core/utils/app_strings.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TextRichWidget extends StatelessWidget {
  final String firstText;
  final String secondText;
  const TextRichWidget({super.key ,required this.firstText, required this.secondText});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
              TextSpan(
                text: firstText,
                style: Styles()
                    .getBody2MeduimStyle(color: firstText == AppStrings.alreadyHaveAccount ?  Theme.of(context).hoverColor : Theme.of(context).cardColor),
                children: [
                  TextSpan(
                    text: secondText,
                    style: secondText == ' *' ? Styles().getBody2MeduimStyle(
                      color: AppColors.red,
                    ) : Styles().getBody2RegularStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            );
  }
}