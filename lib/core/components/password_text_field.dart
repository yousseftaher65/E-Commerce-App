import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_pojo/core/utils/app_colors.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isObscured;
  final VoidCallback showPassword;
  const PasswordTextField({
    super.key,
    required this.hint,
    required this.showPassword,
    this.controller,
    this.validator,
    this.isObscured = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isObscured,
      cursorColor: AppColors.black,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintStyle:
            Styles().getBody1RegulerStyle(color: Theme.of(context).hintColor),
        hintText: hint.tr(),
        suffixIconConstraints: BoxConstraints(minWidth: 50.w, minHeight: 0),
        suffixIcon: IconButton(
          onPressed: showPassword,
          icon: Icon(
            isObscured ? Icons.visibility_outlined : Icons.visibility_off_outlined,
            size: 24.sp,
            color: Theme.of(context).cardColor,
          ),
        ),
      ),
    );
  }
}
