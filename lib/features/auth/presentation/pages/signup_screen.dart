import 'package:ecommerce_pojo/config/routes/page_route_name.dart';
import 'package:ecommerce_pojo/core/components/custom_elevated_button.dart';
import 'package:ecommerce_pojo/core/components/custom_text_field.dart';
import 'package:ecommerce_pojo/core/components/custom_toast.dart';
import 'package:ecommerce_pojo/core/components/password_text_field.dart';
import 'package:ecommerce_pojo/core/components/validators.dart';
import 'package:ecommerce_pojo/core/utils/app_strings.dart';
import 'package:ecommerce_pojo/core/utils/assets.gen.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:ecommerce_pojo/di.dart';
import 'package:ecommerce_pojo/features/auth/data/models/signup_request_model.dart';
import 'package:ecommerce_pojo/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce_pojo/features/auth/presentation/widgets/text_rich_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController fullNameController =
      TextEditingController(text:kDebugMode ? "Youssef Taher" : null);
  final TextEditingController emailController =
      TextEditingController(text:kDebugMode ?  'yousseftaher35@yahoo.com' : null);
  final TextEditingController phoneController =
      TextEditingController(text:kDebugMode ?  '01234567890' : null);
  final TextEditingController passwordController =
      TextEditingController(text:kDebugMode ? 'Taher@1234' : null);
  final TextEditingController confirmPasswordController =
      TextEditingController(text:kDebugMode ?  'Taher@1234' : null);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  void showPassword() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void showConfirmPassword() {
    setState(() {
      isConfirmPasswordVisible = !isConfirmPasswordVisible;
    });
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Theme.of(context).brightness == Brightness.dark
              ? Image.asset(
                  Assets.logos.appLogoDark.path,
                  height: 32.h,
                  width: 104.w,
                )
              : Image.asset(
                  Assets.logos.appLogoLight.path,
                  height: 32.h,
                  width: 104.w,
                ),
        ),
        body: BlocProvider(
          create: (context) => getIt<AuthBloc>(),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.signUpRequestState == RequestState.loaded) {
                context.loaderOverlay.hide();
                CustomToast.show(
                    context: context, message: AppStrings.accountCreated);
                context.go(PageRouteName.login);
              } else if (state.signUpRequestState == RequestState.error) {
                context.loaderOverlay.hide();
                CustomToast.show(
                    context: context,
                    message: state.failure?.message ?? "",
                    imagePath: Assets.icons.error.path);
              } else if (state.signUpRequestState == RequestState.loading) {
                context.loaderOverlay.show();
              }
            },
            builder: (context, state) {
              final bloc = context.read<AuthBloc>();
              return Padding(
                padding: EdgeInsets.only(
                  left: 16.0.w,
                  right: 16.0.w,
                  top: 24.h,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.signup,
                          style: Styles().getHeadline2BoldStyle(
                              color: Theme.of(context).cardColor),
                        ),
                        SizedBox(height: 8.h),
                        GestureDetector(
                          onTap: () {
                            context.push(PageRouteName.login);
                          },
                          child: TextRichWidget(
                              firstText: AppStrings.alreadyHaveAccount,
                              secondText: " ${AppStrings.login}"),
                        ),
                        SizedBox(height: 24.h),
                        TextRichWidget(
                            firstText: AppStrings.fullName, secondText: " *"),
                        SizedBox(height: 8.h),
                        CustomTextField(
                          validation: Validators.validateFullName,
                          controller: fullNameController,
                          hint: AppStrings.fullName,
                        ),
                        SizedBox(height: 8.h),
                        TextRichWidget(
                            firstText: AppStrings.email, secondText: " *"),
                        SizedBox(height: 8.h),
                        CustomTextField(
                          validation: Validators.validateEmail,
                          controller: emailController,
                          hint: AppStrings.email,
                        ),
                        SizedBox(height: 8.h),
                        TextRichWidget(
                            firstText: AppStrings.phoneNumber,
                            secondText: " *"),
                        SizedBox(height: 8.h),
                        CustomTextField(
                          validation: Validators.validatePhoneNumber,
                          controller: phoneController,
                          hint: AppStrings.phoneNumber,
                          textInputType: TextInputType.phone,
                        ),
                        SizedBox(height: 8.h),
                        TextRichWidget(
                            firstText: AppStrings.password, secondText: " *"),
                        SizedBox(height: 8.h),
                        PasswordTextField(
                          validator: Validators.validatePassword,
                          controller: passwordController,
                          isObscured: isPasswordVisible,
                          showPassword: showPassword,
                          hint: AppStrings.passwordHint,
                        ),
                        SizedBox(height: 8.h),
                        TextRichWidget(
                            firstText: AppStrings.confirmPassword,
                            secondText: " *"),
                        SizedBox(height: 8.h),
                        PasswordTextField(
                          controller: confirmPasswordController,
                          isObscured: isConfirmPasswordVisible,
                          showPassword: showConfirmPassword,
                          hint: AppStrings.confirmPasswordHint,
                          validator: (value) =>
                              Validators.validateConfirmPassword(
                            value,
                            passwordController.text,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        CustomElevatedButton(
                            text: AppStrings.createAccount,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                SignupRequestModel requestModel =
                                    SignupRequestModel(
                                  name: fullNameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  password: passwordController.text,
                                  rePassword: confirmPasswordController.text,
                                );
                                bloc.add(
                                  SignUpBtnEvent(
                                      signupRequestModel: requestModel),
                                );
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
