import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/api/api_manager.dart';
import 'package:ecommerce_pojo/core/api/end_points.dart';
import 'package:ecommerce_pojo/core/api/status_code.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/auth/data/datasources/auth_data_source.dart';
import 'package:ecommerce_pojo/features/auth/data/models/auth_response_model.dart';
import 'package:ecommerce_pojo/features/auth/data/models/reset_code_response_model.dart';
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

  @override
  Future<Either<Failure, AuthResponseModel>> forgotPassword(
      {required String email}) async {
    try {
      var res = await apiManager.postRequest(
          endPoint: EndPoints.forgotPassword, body: {"email": email});

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

  @override
  Future<Either<Failure, ResetCodeResponseModel>> resetCode(
      {required String resetCode}) async{
    try {
      var res = await apiManager.postRequest(endPoint: EndPoints.verifyResetCode , body: {"resetCode": resetCode});

      if (res.statusCode! >= 200 && res.statusCode! < 300) {
        return Right(ResetCodeResponseModel.fromJson(res.data));
      } else{
        return Left(ServerFailure(res.data['message'] ?? 'Unknown error occurred'));
      }

    } catch (e) {
      if (e.toString().contains(StatusCode.badRequest.toString())) {
        return Left(ServerFailure("Reset code is invalid or has expired"));
      } else if (e.toString().contains('connection')) {
        return Left(NetworkFailure('Connection Error'));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, AuthResponseModel>> newPassword({required String email, required String newPassword}) async{
     try {
      var res = await apiManager.putRequest(
          endPoint: EndPoints.resetPassword,
          body: {"email": email, "newPassword": newPassword});

      if (res.statusCode! >= 200 && res.statusCode! < 300) {
        return Right(AuthResponseModel.fromJson(res.data));
      } else {
        // Return a server failure
        return Left(
            ServerFailure(res.data['message'] ?? 'Unknown error occurred'));
      }
    } catch (e) {
      if (e.toString().contains(StatusCode.badRequest.toString())) {
        return Left(ServerFailure("reset code not verified"));
      } else if (e.toString().contains(StatusCode.notFound.toString())) {
        return Left(ServerFailure('There is no user with this email address'));
      } else if (e.toString().contains('connection')) {
        return Left(NetworkFailure('Connection Error'));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
