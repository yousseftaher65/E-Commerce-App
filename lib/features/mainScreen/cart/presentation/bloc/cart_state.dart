part of 'cart_bloc.dart';

class CartState {
  CartRequestState? addToCartRequestState;
  CartRequestState? removeFromCartRequestState;
  CartRequestState? getCartItems;
  CartModel? cartModel;
  CartItemModel? cartItemModel;
  Failure? failure;
  CartState(
      {this.cartModel,
      this.cartItemModel,
      this.addToCartRequestState = CartRequestState.initial,
      this.removeFromCartRequestState = CartRequestState.initial,
      this.getCartItems = CartRequestState.initial,
      this.failure});

  CartState copyWith({
    CartRequestState? addToCartRequestState,
    CartRequestState? getCartItems,
    CartRequestState? removeFromCartRequestState,
    CartModel? cartModel,
    CartItemModel? cartItemModel,
    Failure? failure,
  }) {
    return CartState(
      cartModel: cartModel ?? this.cartModel,
      cartItemModel: cartItemModel ?? this.cartItemModel,
      addToCartRequestState:
          addToCartRequestState ?? this.addToCartRequestState,
      removeFromCartRequestState:
          removeFromCartRequestState ?? this.removeFromCartRequestState,
      getCartItems: getCartItems ?? this.getCartItems,
      failure: failure ?? this.failure,
    );
  }
}

class CartInitial extends CartState {
  CartInitial() : super(addToCartRequestState: CartRequestState.initial , getCartItems: CartRequestState.initial , removeFromCartRequestState: CartRequestState.initial);
}

enum CartRequestState {
  initial,
  loading,
  loaded,
  error,
}
