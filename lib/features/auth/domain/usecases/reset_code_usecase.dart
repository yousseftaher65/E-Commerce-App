import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/auth/data/models/reset_code_response_model.dart';
import 'package:ecommerce_pojo/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetCodeUsecase {
  AuthRepo authRepo;
  ResetCodeUsecase({required this.authRepo});

  Future<Either<Failure, ResetCodeResponseModel>> call({required String resetCode}) =>
      authRepo.resetCode(resetCode: resetCode);
}
