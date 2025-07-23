import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/mainScreen/profile/data/models/address_model.dart';
import 'package:ecommerce_pojo/features/mainScreen/profile/data/models/address_response.dart';

abstract class ProfileDataSource {
  Future<Either<Failure, AddressResponse>> updateProfile(
      {AddressModel? addressModel});
}
