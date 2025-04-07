import 'package:ecommerce_pojo/core/components/custom_elevated_button.dart';
import 'package:ecommerce_pojo/core/utils/app_strings.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAlertDialog extends StatelessWidget {
  final String? message;
  const CustomAlertDialog({super.key , this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
                  backgroundColor: Theme.of(context).cardColor,
                  title: Text(
                    AppStrings.error,
                    textAlign: TextAlign.center,
                    style: Styles().getBody1RegularStyle(
                        color: Theme.of(context).scaffoldBackgroundColor),
                  ),
                  content: Text(
                    message ?? "",
                    textAlign: TextAlign.center,
                    //overflow: TextOverflow.ellipsis,
                    style: Styles().getBody2RegularStyle(
                        color: Theme.of(context).scaffoldBackgroundColor),
                  ),
                  actions: [
                    CustomElevatedButton(
                        text: AppStrings.ok,
                        textColor: Theme.of(context).scaffoldBackgroundColor,
                        onPressed: () {
                          context.pop();
                        })
                  ],
                );
  }
}