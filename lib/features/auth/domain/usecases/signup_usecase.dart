import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/auth/data/models/signup_request_model.dart';
import 'package:ecommerce_pojo/features/auth/domain/entities/auth_response_entity.dart';
import 'package:ecommerce_pojo/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class SignupUsecase {
  AuthRepo authRepo;
  SignupUsecase({required this.authRepo});

  Future<Either< Failure,AuthResponseEntity>> call({required SignupRequestModel? request}) =>  authRepo.signup(request: request);
  
}