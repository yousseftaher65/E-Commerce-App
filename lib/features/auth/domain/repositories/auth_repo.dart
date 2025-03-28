import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/auth/data/models/reset_code_response_model.dart';
import 'package:ecommerce_pojo/features/auth/data/models/signup_request_model.dart';
import 'package:ecommerce_pojo/features/auth/domain/entities/auth_response_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure,AuthResponseEntity>> signup({required SignupRequestModel? request});
  Future<Either<Failure,AuthResponseEntity>> signin({required String email , required String password});
  Future<Either<Failure,AuthResponseEntity>> forgotPaassword({required String email});
  Future<Either<Failure,ResetCodeResponseModel>> resetCode({required String resetCode});
  Future<Either<Failure, AuthResponseEntity>> newPassword(
      {required String email, required String newPassword});
}