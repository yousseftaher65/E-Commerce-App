import 'package:ecommerce_pojo/core/components/custom_toast.dart';
import 'package:ecommerce_pojo/core/utils/assets.gen.dart';
import 'package:ecommerce_pojo/di.dart';
import 'package:ecommerce_pojo/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce_pojo/features/auth/presentation/widgets/create_password_widget.dart';
import 'package:ecommerce_pojo/features/auth/presentation/widgets/forgot_password_widget.dart';
import 'package:ecommerce_pojo/features/auth/presentation/widgets/password_created_successfully_widget.dart';
import 'package:ecommerce_pojo/features/auth/presentation/widgets/reset_code_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController(
      text: kDebugMode ? 'yousseftaher35@yahoo.com' : null);
  final TextEditingController resetCodeController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  int currentStep = 1;

  @override
  void dispose() {
    emailController.dispose();
    resetCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listenWhen: (previous, current) =>
                current.forgotPasswordRequestState !=
                previous.forgotPasswordRequestState,
            listener: (context, state) {
              if (state.forgotPasswordRequestState == RequestState.loaded) {
                context.loaderOverlay.hide();
                CustomToast.show(
                  context: context,
                  message: state.entity?.message ?? "",
                  imagePath: Assets.icons.success.path,
                );
                setState(() {
                  currentStep = 2; // Move to Reset Code step
                });
              } else if (state.forgotPasswordRequestState ==
                  RequestState.error) {
                context.loaderOverlay.hide();
                CustomToast.show(
                  context: context,
                  message: state.failure?.message ?? "",
                  imagePath: Assets.icons.error.path,
                );
              } else if (state.forgotPasswordRequestState ==
                  RequestState.loading) {
                context.loaderOverlay.show();
              }
            },
          ),
          BlocListener<AuthBloc, AuthState>(
            listenWhen: (previous, current) =>
                current.resetCodeRequestState != previous.resetCodeRequestState,
            listener: (context, state) {
              if (state.resetCodeRequestState == RequestState.loaded) {
                context.loaderOverlay.hide();
                setState(() {
                  currentStep = 3;
                });
                // Navigate to the next page or perform any other action
              } else if (state.resetCodeRequestState == RequestState.error) {
                context.loaderOverlay.hide();
                CustomToast.show(
                  context: context,
                  message: state.failure?.message ?? "",
                  imagePath: Assets.icons.error.path,
                );
              } else if (state.resetCodeRequestState == RequestState.loading) {
                context.loaderOverlay.show();
              }
            },
          ),
          BlocListener<AuthBloc, AuthState>(
            listenWhen: (previous, current) =>
                current.newPasswordRequestState !=
                previous.newPasswordRequestState,
            listener: (context, state) {
              if (state.newPasswordRequestState == RequestState.loaded) {
                context.loaderOverlay.hide();
                // Navigate to the next page or perform any other action
                setState(() {
                  currentStep = 4;
                });
              } else if (state.newPasswordRequestState == RequestState.error) {
                context.loaderOverlay.hide();
                CustomToast.show(
                  context: context,
                  message: state.failure?.message ?? "",
                  imagePath: Assets.icons.error.path,
                );
              } else if (state.newPasswordRequestState ==
                  RequestState.loading) {
                context.loaderOverlay.show();
              }
            },
          ),
        ],
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            final bloc = context.read<AuthBloc>();
            if (currentStep == 4) {
              return const PasswordCreatedSuccessfullyWidget();
            } else if (currentStep == 3) {
              return CreatePasswordWidget(bloc: bloc);
            } else if (currentStep == 2) {
              return ResetCodeWidget(
                bloc: bloc,
                emailController: emailController,
              );
            }
            return ForgotPasswordWidget(
              bloc: bloc,
              emailController: emailController,
            );
          },
        ),
      ),
    );
  }
}
