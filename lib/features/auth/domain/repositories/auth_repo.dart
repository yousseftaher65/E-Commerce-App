import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/auth/data/models/signup_request_model.dart';
import 'package:ecommerce_pojo/features/auth/domain/entities/auth_response_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure,AuthResponseEntity>> signup({required SignupRequestModel? request});
}