part of 'wishlist_bloc.dart';

abstract class WishlistEvent {
  const WishlistEvent();
}

class GetWishlistItemsEvent extends WishlistEvent {
  const GetWishlistItemsEvent();
}

class AddToWishlistEvent extends WishlistEvent {
  final String productId;
  const AddToWishlistEvent({required this.productId});
}

class RemoveFromWishlistEvent extends WishlistEvent {
  final String productId;
  const RemoveFromWishlistEvent({required this.productId});
}