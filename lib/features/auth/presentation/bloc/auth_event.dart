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