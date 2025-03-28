import 'package:ecommerce_pojo/core/components/custom_elevated_button.dart';
import 'package:ecommerce_pojo/core/components/custom_text_field.dart';
import 'package:ecommerce_pojo/core/components/validators.dart';
import 'package:ecommerce_pojo/core/utils/app_strings.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:ecommerce_pojo/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce_pojo/features/auth/presentation/widgets/text_rich_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordWidget extends StatefulWidget {
  final AuthBloc bloc;
  final TextEditingController emailController;
  const ForgotPasswordWidget(
      {super.key, required this.bloc, required this.emailController});

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordWidget> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                AppStrings.forgotPasswordAppBar,
                style: Styles()
                    .getBody2MeduimStyle(color: Theme.of(context).cardColor),
              ),
              const Spacer(),
               RichText(
                text: TextSpan(
                    text: '01/',
                    style: Styles().getBody2RegularStyle(
                        color: Theme.of(context).cardColor),
                    children: [
                      TextSpan(
                        text: '03',
                        style: Styles().getBody2MeduimStyle(
                            color: Theme.of(context).hintColor),
                      ),
                    ]),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 24.h, left: 16.w, right: 16.w),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.emailConfirmation,
                  style: Styles().getHeadline2BoldStyle(
                      color: Theme.of(context).cardColor),
                ),
                SizedBox(height: 8.h),
                Text(
                  AppStrings.emailConfirmationContent,
                  style: Styles().getBody2RegularStyle(
                      color: Theme.of(context).hoverColor),
                ),
                SizedBox(height: 16.h),
                TextRichWidget(firstText: AppStrings.email, secondText: " *"),
                SizedBox(height: 8.h),
                CustomTextField(
                  hint: AppStrings.email,
                  maxLines: 1,
                  validation: Validators.validateEmail,
                  controller: widget.emailController,
                ),
                SizedBox(height: 24.h),
                CustomElevatedButton(
                    text: AppStrings.send,
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (formkey.currentState!.validate()) {
                        widget.bloc.add(ForgotPasswordBtnEvent(
                            email: widget.emailController.text));
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
