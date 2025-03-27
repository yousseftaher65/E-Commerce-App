import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/auth/domain/entities/auth_response_entity.dart';
import 'package:ecommerce_pojo/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SigninUsecase {
  AuthRepo authRepo;
  SigninUsecase({required this.authRepo});

  Future<Either<Failure, AuthResponseEntity>> call(
          {required String email, required String password}) =>
      authRepo.signin(email: email, password: password);
}
