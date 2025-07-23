import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/mainScreen/profile/data/models/address_model.dart';
import 'package:ecommerce_pojo/features/mainScreen/profile/data/models/address_response.dart';
import 'package:ecommerce_pojo/features/mainScreen/profile/domain/repositories/shipping_address_repo.dart';
import 'package:injectable/injectable.dart';


@injectable
class ShippingAddressUsecase {
  ShippingAddressRepo shippingAddressRepo;
  ShippingAddressUsecase({required this.shippingAddressRepo});

  Future<Either<Failure, AddressResponse>> call({
    AddressModel? addressModel,
  }) {
    return shippingAddressRepo.updateShippingAddress(
        addressModel: addressModel);
  }
}
