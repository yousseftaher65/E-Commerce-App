import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/api/api_manager.dart';
import 'package:ecommerce_pojo/core/api/end_points.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/core/helpers/shared_preference.dart';
import 'package:ecommerce_pojo/features/mainScreen/profile/data/datasources/profile_datasource.dart';
import 'package:ecommerce_pojo/features/mainScreen/profile/data/models/address_model.dart';
import 'package:ecommerce_pojo/features/mainScreen/profile/data/models/address_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileDataSource)
class ProfileDatasourceImpl implements ProfileDataSource {
  ApiManager apiManager;
  ProfileDatasourceImpl({required this.apiManager});
  @override
  Future<Either<Failure, AddressResponse>> updateProfile(
      {AddressModel? addressModel}) async {
    try {
      String token = SharedPreferenceHelper.getString('token') ?? '';
      var res = await apiManager.postRequest(
        endPoint: EndPoints.addresses,
        headers: {'token': token},
        body: addressModel?.toJson(),
      );
      if (res.statusCode == 200) {
        AddressResponse addressResponse = AddressResponse.fromJson(res.data);
        return Right(addressResponse);
      } else {
        return Left(Failure(res.statusMessage ?? 'Unknown error occurred'));
      }
    } catch (e) {
      if (e.toString().contains('connection')) {
        return Left(NetworkFailure('Please Check Your Internet Connection'));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
