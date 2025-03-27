import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/api/api_manager.dart';
import 'package:ecommerce_pojo/core/api/end_points.dart';
import 'package:ecommerce_pojo/core/api/status_code.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/auth/data/datasources/auth_data_source.dart';
import 'package:ecommerce_pojo/features/auth/data/models/auth_response_model.dart';
import 'package:ecommerce_pojo/features/auth/data/models/signup_request_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthDataSource)
class AuthDataSourceImple implements AuthDataSource {
  ApiManager apiManager;
  AuthDataSourceImple({required this.apiManager});
  @override
  Future<Either<Failure, AuthResponseModel>> signup(
      {SignupRequestModel? request}) async {
    try {
      var res = await apiManager.postRequest(
          endPoint: EndPoints.signup, body: request!.toJson());

      if (res.statusCode! >= 200 && res.statusCode! < 300) {
        return Right(AuthResponseModel.fromJson(res.data));
      } else {
        // Return a server failure
        return Left(
            ServerFailure(res.data['message'] ?? 'Unknown error occurred'));
      }
    } catch (e) {
      if (e.toString().contains(StatusCode.conflict.toString())) {
        return Left(ServerFailure('User already exists'));
      } else if (e.toString().contains('connection')) {
        return Left(NetworkFailure('Connection Error'));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponseModel>> signin(
      {required String email, required String password}) async {
    try {
      var res = await apiManager.postRequest(
          endPoint: EndPoints.signin,
          body: {"email": email, "password": password});

      if (res.statusCode! >= 200 && res.statusCode! < 300) {
        return Right(AuthResponseModel.fromJson(res.data));
      } else {
        // Return a server failure
        return Left(
            ServerFailure(res.data['message'] ?? 'Unknown error occurred'));
      }
    } catch (e) {
      if (e.toString().contains(StatusCode.unauthorized.toString())) {
        return Left(ServerFailure("Incorrect email or password"));
      } else if (e.toString().contains('connection')) {
        return Left(NetworkFailure('Connection Error'));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
