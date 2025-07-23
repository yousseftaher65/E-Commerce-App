import 'package:bloc/bloc.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/mainScreen/profile/data/models/address_model.dart';
import 'package:ecommerce_pojo/features/mainScreen/profile/data/models/address_response.dart';
import 'package:ecommerce_pojo/features/mainScreen/profile/domain/usecases/shipping_address_usecase.dart';
import 'package:injectable/injectable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ShippingAddressUsecase shippingAddressUsecase;
  ProfileBloc(
    this.shippingAddressUsecase,
  ) : super(ProfileInitial()) {
    on<UpdateShippingAddressEvent>(onUpdateShippingAddressEvent);
  }

  Future<void> onUpdateShippingAddressEvent(
      UpdateShippingAddressEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(
      updateShippingAddressRequestState: ProfileRequestState.loading,
    ));
    var res = await shippingAddressUsecase.call(
      addressModel: event.addressModel,
    );
    res.fold(
      (failure) => emit(state.copyWith(
        updateShippingAddressRequestState: ProfileRequestState.error,
        failure: failure,
      )),
      (addressResponse) => emit(state.copyWith(
        addressResponse: addressResponse,
        updateShippingAddressRequestState: ProfileRequestState.loaded,
      )),
    );
  }
}
