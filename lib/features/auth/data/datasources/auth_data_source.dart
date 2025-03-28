import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/auth/data/models/auth_response_model.dart';
import 'package:ecommerce_pojo/features/auth/data/models/reset_code_response_model.dart';
import 'package:ecommerce_pojo/features/auth/data/models/signup_request_model.dart';

abstract class AuthDataSource {
  Future<Either<Failure, AuthResponseModel>> signup(
      {SignupRequestModel? request});
  Future<Either<Failure, AuthResponseModel>> signin(
      {required String email, required String password});
  Future<Either<Failure, AuthResponseModel>> forgotPassword(
      {required String email});
  Future<Either<Failure, ResetCodeResponseModel>> resetCode(
      {required String resetCode});
  Future<Either<Failure, AuthResponseModel>> newPassword(
      {required String email, required String newPassword});
}
