part of 'wishlist_bloc.dart';

class WishlistState {
  WishlistRequestState? addToWishlistRequestState;
  WishlistRequestState? removeFromWishlistRequestState;
  WishlistRequestState? getWishlistItemsRequestState;
  WishlistModel? wishlistModel;
  WishlistItemModel? wishlistItemModel;
  Failure? failure;
  WishlistState(
      {this.wishlistModel,
      this.addToWishlistRequestState = WishlistRequestState.initial,
      this.removeFromWishlistRequestState = WishlistRequestState.initial,
      this.getWishlistItemsRequestState = WishlistRequestState.initial,
      this.wishlistItemModel,
      this.failure});

  WishlistState copyWith({
    WishlistRequestState? addToWishlistRequestState,
    WishlistRequestState? getWishlistItemsRequestState,
    WishlistRequestState? removeFromWishlistRequestState,
    WishlistModel? wishlistModel,
    WishlistItemModel? wishlistItemModel,
    Failure? failure,
  }) {
    return WishlistState(
      wishlistModel: wishlistModel ?? this.wishlistModel,
      wishlistItemModel: wishlistItemModel ?? this.wishlistItemModel,
      addToWishlistRequestState:
          addToWishlistRequestState ?? this.addToWishlistRequestState,
      removeFromWishlistRequestState:
          removeFromWishlistRequestState ?? this.removeFromWishlistRequestState,
      getWishlistItemsRequestState: getWishlistItemsRequestState ?? this.getWishlistItemsRequestState,
      failure: failure ?? this.failure,
    );
  }
}

class WishlistInitial extends WishlistState {
  WishlistInitial()
      : super(
            addToWishlistRequestState: WishlistRequestState.initial,
            getWishlistItemsRequestState: WishlistRequestState.initial,
            removeFromWishlistRequestState: WishlistRequestState.initial);
}

enum WishlistRequestState {
  initial,
  loading,
  loaded,
  error,
}
