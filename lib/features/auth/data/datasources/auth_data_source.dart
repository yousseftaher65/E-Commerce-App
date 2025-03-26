import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/auth/data/models/auth_response_model.dart';
import 'package:ecommerce_pojo/features/auth/data/models/signup_request_model.dart';

abstract class AuthDataSource {
  Future<Either<Failure, AuthResponseModel>> signup({SignupRequestModel? request});
}