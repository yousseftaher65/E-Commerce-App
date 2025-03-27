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
import 'package:ecommerce_pojo/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce_pojo/features/auth/presentation/widgets/text_rich_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController emailController = TextEditingController(
      text: kDebugMode ? 'yousseftaher35@yahoo.com' : null);
  final TextEditingController passwordController = TextEditingController(text: kDebugMode ? 'Taher@1234' : null);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isPasswordVisible = true;

  void showPassword() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
              if (state.signinRequestState == RequestState.loaded) {
                context.loaderOverlay.hide();
                context.go(PageRouteName.home);
              } else if (state.signinRequestState == RequestState.error) {
                context.loaderOverlay.hide();
                CustomToast.show(
                    context: context,
                    message: state.failure?.message ?? "",
                    imagePath: Assets.icons.error.path);
              } else if (state.signinRequestState == RequestState.loading) {
                context.loaderOverlay.show();
              }
            },
            builder: (context, state) {
              final bloc = context.read<AuthBloc>();
              return Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.login,
                        style: Styles().getHeadline2BoldStyle(
                            color: Theme.of(context).cardColor),
                      ),
                      SizedBox(height: 8.h),
                      GestureDetector(
                        onTap: () {
                          context.push(PageRouteName.signup);
                        },
                        child: TextRichWidget(
                            firstText: AppStrings.dontHaveAccount,
                            secondText: " ${AppStrings.signup}"),
                      ),
                      SizedBox(height: 32.h),
                      TextRichWidget(
                          firstText: AppStrings.email, secondText: " *"),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () =>
                                context.push(PageRouteName.forgotPassword),
                            child: Text(
                              AppStrings.forgetPassword,
                              style: Styles().getBody2RegularStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      CustomElevatedButton(
                        text: AppStrings.login,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            bloc.add(SigninBtnEvent(
                                email: emailController.text,
                                password: passwordController.text));
                          }
                        },
                      ),
                    ],
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
