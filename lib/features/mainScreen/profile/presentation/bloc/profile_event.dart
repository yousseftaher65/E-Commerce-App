part of 'profile_bloc.dart';

abstract class ProfileEvent {
  const ProfileEvent();
}

class UpdateShippingAddressEvent extends ProfileEvent {
  final AddressModel addressModel;

  const UpdateShippingAddressEvent({required this.addressModel});
}
