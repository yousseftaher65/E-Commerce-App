import 'package:ecommerce_pojo/core/components/custom_elevated_button.dart';
import 'package:ecommerce_pojo/core/components/custom_toast.dart';
import 'package:ecommerce_pojo/core/utils/app_strings.dart';
import 'package:ecommerce_pojo/core/utils/assets.gen.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:ecommerce_pojo/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetCodeWidget extends StatefulWidget {
  final AuthBloc bloc;
  final TextEditingController emailController;
  const ResetCodeWidget({
    super.key,
    required this.bloc,
    required this.emailController,
  });

  @override
  State<ResetCodeWidget> createState() => _ResetCodeWidgetState();
}

class _ResetCodeWidgetState extends State<ResetCodeWidget> {
  final int codeLength = 6; // Number of digits in the reset code
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(codeLength, (_) => TextEditingController());
    focusNodes = List.generate(codeLength, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  String getResetCode() {
    return controllers.map((controller) => controller.text).join();
  }

  void onDigitEntered(int index, String value) {
    if (index < codeLength - 1) {
      // Move to the next field
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    } else {
      // Dismiss the keyboard if it's the last field
      FocusScope.of(context).unfocus();
    }
  }

  void onBackspacePressed(int index) {
    if (index > 0) {
      // Move to the previous field
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
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
                AppStrings.forgotPasswordAppBar,
                style: Styles()
                    .getBody2MeduimStyle(color: Theme.of(context).cardColor),
              ),
              const Spacer(),
               RichText(
                text: TextSpan(
                    text: '02/',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.emailVerficationTitle,
                style: Styles()
                    .getHeadline2BoldStyle(color: Theme.of(context).cardColor),
              ),
              SizedBox(height: 8.h),
              Text(
                AppStrings.emailVerficationContent,
                style: Styles()
                    .getBody2RegularStyle(color: Theme.of(context).hoverColor),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(codeLength, (index) {
                  return SizedBox(
                    width: 40.w,
                    child: TextField(
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      decoration: const InputDecoration(
                        counterText: '', // Hide the character counter
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          onDigitEntered(index, value);
                        } else {
                          // Move to the previous field if backspace is pressed
                          onBackspacePressed(index);
                        }
                      },
                    ),
                  );
                }),
              ),
              SizedBox(height: 24.h),
              CustomElevatedButton(
                  text: AppStrings.resend,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  textColor: Theme.of(context).primaryColor,
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    widget.bloc.add(ForgotPasswordBtnEvent(
                        email: widget.emailController.text));
                  }),
              SizedBox(height: 16.h),
              CustomElevatedButton(
                  text: AppStrings.proceed,
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    final resetCode = getResetCode();
                    if (resetCode.length == codeLength) {
                      widget.bloc.add(ResetCodeBtnEvent(resetCode: resetCode));
                    } else {
                      CustomToast.show(
                          context: context,
                          message: 'Please Enter Correct 6 Digits',
                          imagePath: Assets.icons.error.path);
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
