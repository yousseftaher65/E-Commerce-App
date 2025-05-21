
import 'package:bloc/bloc.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/mainScreen/cart/data/models/cart_item_model.dart';
import 'package:ecommerce_pojo/features/mainScreen/cart/data/models/cart_model.dart';
import 'package:ecommerce_pojo/features/mainScreen/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:ecommerce_pojo/features/mainScreen/cart/domain/usecases/get_cart_items_usecase.dart';
import 'package:ecommerce_pojo/features/mainScreen/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:injectable/injectable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  GetCartItemsUsecase getCartItemsUsecase;
  AddToCartUsecase addToCartUsecase;
  RemoveFromCartUsecase removeFromCartUsecase;
  CartBloc(this.addToCartUsecase, this.getCartItemsUsecase,
      this.removeFromCartUsecase)
      : super(CartInitial()) {
    on<AddToCartEvent>(onAddToCartEvent);
    on<GetCartItemsEvent>(onGetCartItemsEvent);
    on<RemoveFromCartEvent>(onRemoveFromCartEvent);
  }

  onAddToCartEvent(AddToCartEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(addToCartRequestState: CartRequestState.loading));

    var res = await addToCartUsecase.call(event.productId);
    res.fold(
        (failure) => (emit(state.copyWith(
            addToCartRequestState: CartRequestState.error, failure: failure))),
        (response) => (emit(state.copyWith(
            cartModel: response,
            addToCartRequestState: CartRequestState.loaded))));
  }

  onGetCartItemsEvent(GetCartItemsEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(getCartItems: CartRequestState.loading));

    var res = await getCartItemsUsecase.call();
    res.fold(
        (failure) => (emit(state.copyWith(
            getCartItems: CartRequestState.error, failure: failure))),
        (response) => (emit(state.copyWith(
            cartItemModel: response, getCartItems: CartRequestState.loaded))));
  }

  onRemoveFromCartEvent(
      RemoveFromCartEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(removeFromCartRequestState: CartRequestState.loading));

    var res = await removeFromCartUsecase.call(event.productId);

    res.fold(
        (failure) => (emit(state.copyWith(
            removeFromCartRequestState: CartRequestState.error,
            failure: failure))),
        (response) => (emit(state.copyWith(
            cartModel: response,
            removeFromCartRequestState: CartRequestState.loaded))));
  }
}
