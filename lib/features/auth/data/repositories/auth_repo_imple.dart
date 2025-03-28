import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/auth/data/datasources/auth_data_source.dart';
import 'package:ecommerce_pojo/features/auth/data/models/reset_code_response_model.dart';
import 'package:ecommerce_pojo/features/auth/data/models/signup_request_model.dart';
import 'package:ecommerce_pojo/features/auth/domain/entities/auth_response_entity.dart';
import 'package:ecommerce_pojo/features/auth/domain/repositories/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImple implements AuthRepo {
  AuthDataSource authDS;
  AuthRepoImple({required this.authDS});
  @override
  Future<Either<Failure, AuthResponseEntity>> signup(
      {SignupRequestModel? request}) async {
    /*  try {
     var res = await authDS.signup(request: request);
      return Left(res);
    } catch (e) {
      return Right(ServerFailure(e.toString()));
    } */

    var res = await authDS.signup(request: request);
    return res.fold((failure) => Left(failure), (response) => Right(response));
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> signin(
      {required String email, required String password}) async {
    var res = await authDS.signin(email: email, password: password);
    return res.fold((failure) => Left(failure), (response) => Right(response));
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> forgotPaassword(
      {required String email}) async {
    var res = await authDS.forgotPassword(
      email: email,
    );
    return res.fold((failure) => Left(failure), (response) => Right(response));
  }

  @override
  Future<Either<Failure, ResetCodeResponseModel>> resetCode(
      {required String resetCode}) async {
    var res = await authDS.resetCode(resetCode: resetCode);
    return res.fold((failure) => Left(failure), (response) => Right(response));
  }
  
  @override
  Future<Either<Failure, AuthResponseEntity>> newPassword({required String email, required String newPassword}) async{
     var res = await authDS.newPassword(email: email, newPassword: newPassword);
    return res.fold((failure) => Left(failure), (response) => Right(response));
  }
}
