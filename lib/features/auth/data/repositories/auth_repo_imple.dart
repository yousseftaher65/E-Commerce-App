import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/auth/data/datasources/auth_data_source.dart';
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
    return res.fold(
        (failure) => Left(failure), (response) => Right(response));
  }
}
