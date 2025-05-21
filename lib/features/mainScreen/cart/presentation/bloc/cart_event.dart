part of 'cart_bloc.dart';

abstract class CartEvent{
  const CartEvent();
}


class GetCartItemsEvent extends CartEvent {
  const GetCartItemsEvent();
}
class AddToCartEvent extends CartEvent {
  final String productId;
  const AddToCartEvent({required this.productId});
}
class RemoveFromCartEvent extends CartEvent {
  final String productId;
  const RemoveFromCartEvent({required this.productId});
}
