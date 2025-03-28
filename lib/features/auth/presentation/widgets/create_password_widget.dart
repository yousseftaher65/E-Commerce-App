import 'package:ecommerce_pojo/core/components/custom_elevated_button.dart';
import 'package:ecommerce_pojo/core/components/custom_text_field.dart';
import 'package:ecommerce_pojo/core/components/password_text_field.dart';
import 'package:ecommerce_pojo/core/components/validators.dart';
import 'package:ecommerce_pojo/core/utils/app_strings.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:ecommerce_pojo/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce_pojo/features/auth/presentation/widgets/text_rich_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatePasswordWidget extends StatefulWidget {
 final AuthBloc bloc;
  const CreatePasswordWidget({super.key , required this.bloc});

  @override
  State<CreatePasswordWidget> createState() => _CreatePasswordWidgetState();
}

class _CreatePasswordWidgetState extends State<CreatePasswordWidget> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController(
      text: kDebugMode ? 'yousseftaher35@yahoo.com' : null);

  bool isPasswordVisible = true;

  void showPassword() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

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
                AppStrings.createPassword,
                style: Styles()
                    .getBody2MeduimStyle(color: Theme.of(context).cardColor),
              ),
              const Spacer(),
              RichText(
                text: TextSpan(
                    text: '03/',
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
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.newPassword,
                  style: Styles().getHeadline2BoldStyle(
                      color: Theme.of(context).cardColor),
                ),
                SizedBox(height: 8.h),
                Text(
                  AppStrings.newPasswordContent,
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
                  controller: emailController,
                ),
                SizedBox(height: 16.h),
                TextRichWidget(
                    firstText: AppStrings.password, secondText: " *"),
                SizedBox(height: 8.h),
                PasswordTextField(
                  hint: AppStrings.passwordHint,
                  showPassword: showPassword,
                  isObscured: isPasswordVisible,
                  controller: passwordController,
                  validator: Validators.validatePassword,
                ),
                SizedBox(height: 24.h),
                CustomElevatedButton(
                    text: AppStrings.save,
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (formKey.currentState!.validate()){
                        widget.bloc.add(NewPasswordBtnEvent(email: emailController.text, newPassword: passwordController.text));
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
