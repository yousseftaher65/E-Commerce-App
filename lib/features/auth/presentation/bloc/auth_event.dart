part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class SignUpBtnEvent extends AuthEvent {
  final SignupRequestModel signupRequestModel;
 const SignUpBtnEvent({required this.signupRequestModel});
}

class SigninBtnEvent extends AuthEvent {
  final String email;
  final String password;

  const SigninBtnEvent({required this.email, required this.password});
}
class ForgotPasswordBtnEvent extends AuthEvent {
  final String email; 
  const ForgotPasswordBtnEvent({required this.email});
}

class ResetCodeBtnEvent extends AuthEvent {
  final String resetCode;
  const ResetCodeBtnEvent({required this.resetCode});
}

class NewPasswordBtnEvent extends AuthEvent {
  final String email;
  final String newPassword;

  const NewPasswordBtnEvent({required this.email, required this.newPassword});
}
