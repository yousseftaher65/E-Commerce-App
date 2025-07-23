part of 'profile_bloc.dart';

class ProfileState {
 ProfileRequestState? updateShippingAddressRequestState;
  AddressResponse? addressResponse;
  Failure? failure;

  ProfileState({
    this.updateShippingAddressRequestState = ProfileRequestState.initial,
    this.addressResponse,
    this.failure,
  });

  ProfileState copyWith({
    ProfileRequestState? updateShippingAddressRequestState,
    AddressResponse? addressResponse,
    Failure? failure,
  }) {
    return ProfileState(
      updateShippingAddressRequestState:
          updateShippingAddressRequestState ?? this.updateShippingAddressRequestState,
      addressResponse: addressResponse ?? this.addressResponse,
      failure: failure ?? this.failure,
    );
  }
}

class ProfileInitial extends ProfileState {
  ProfileInitial() : super(
    updateShippingAddressRequestState: ProfileRequestState.initial,
  );
}

enum ProfileRequestState {
  initial,
  loading,
  loaded,
  error,
}
