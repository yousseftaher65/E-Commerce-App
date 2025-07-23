import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/mainScreen/profile/data/datasources/profile_datasource.dart';
import 'package:ecommerce_pojo/features/mainScreen/profile/data/models/address_model.dart';
import 'package:ecommerce_pojo/features/mainScreen/profile/data/models/address_response.dart';
import 'package:ecommerce_pojo/features/mainScreen/profile/domain/repositories/shipping_address_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ShippingAddressRepo)
class ShippingAddressRepoImpl implements ShippingAddressRepo {
  ProfileDataSource dataSource;
  ShippingAddressRepoImpl({required this.dataSource});
  @override
  Future<Either<Failure, AddressResponse>> updateShippingAddress(
      {AddressModel? addressModel}) async {
    var res = await dataSource.updateProfile(addressModel: addressModel);
    return res.fold(
      (failure) => Left(failure),
      (addressResponse) => Right(addressResponse),
    );
  }
}
