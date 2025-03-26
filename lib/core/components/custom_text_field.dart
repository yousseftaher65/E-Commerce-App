import 'package:ecommerce_pojo/core/utils/app_colors.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final TextInputType textInputType;
  final int? maxLines;
  final String? Function(String?)? validation;

  const CustomTextField({
    super.key,
    this.controller,
    this.hint,
    this.textInputType = TextInputType.text,
    this.validation,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validation,
      controller: controller,
      cursorColor: AppColors.black,
      keyboardType: textInputType,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle:
            Styles().getBody1RegularStyle(color: Theme.of(context).hintColor),
      ),
    );
  }
}
