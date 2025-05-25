import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/mainScreen/wishlist/data/models/wishlist_item_model.dart';
import 'package:ecommerce_pojo/features/mainScreen/wishlist/data/models/wishlist_model.dart';
import 'package:ecommerce_pojo/features/mainScreen/wishlist/domain/usecases/add_to_wishlist_usecase.dart';
import 'package:ecommerce_pojo/features/mainScreen/wishlist/domain/usecases/get_wishlist_items_usecase.dart';
import 'package:ecommerce_pojo/features/mainScreen/wishlist/domain/usecases/remove_from_wishlist_usecase.dart';
import 'package:injectable/injectable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

@injectable
class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  GetWishlistItemsUsecase getWishlistItemsUsecase;
  AddToWishlistUsecase addToWishlistUsecase;
  RemoveFromWishlistUsecase removeFromWishlistUsecase;
  WishlistBloc(
    this.addToWishlistUsecase,
    this.getWishlistItemsUsecase,
    this.removeFromWishlistUsecase,
  ) : super(WishlistInitial()) {
    on<GetWishlistItemsEvent>(onGetWishlistItemsEvent);
    on<AddToWishlistEvent>(onAddToWishlistEvent);
    on<RemoveFromWishlistEvent>(onRemoveFromWishlistEvent);
  }

  FutureOr<void> onGetWishlistItemsEvent(
      GetWishlistItemsEvent event, Emitter<WishlistState> emit) async {
    emit(state.copyWith(
        getWishlistItemsRequestState: WishlistRequestState.loading));

    var res = await getWishlistItemsUsecase.call();
    res.fold(
        (failure) => (emit(state.copyWith(
            getWishlistItemsRequestState: WishlistRequestState.error,
            failure: failure))),
        (response) => (emit(state.copyWith(
            wishlistItemModel: response,
            getWishlistItemsRequestState: WishlistRequestState.loaded))));
  }

  FutureOr<void> onAddToWishlistEvent(
      AddToWishlistEvent event, Emitter<WishlistState> emit) async {
    emit(state.copyWith(
        addToWishlistRequestState: WishlistRequestState.loading));
    var res = await addToWishlistUsecase.call(event.productId);
    res.fold(
        (failure) => (emit(state.copyWith(
            addToWishlistRequestState: WishlistRequestState.error,
            failure: failure))),
        (response) => (emit(state.copyWith(
            wishlistModel: response,
            addToWishlistRequestState: WishlistRequestState.loaded))));
  }

  FutureOr<void> onRemoveFromWishlistEvent(
      RemoveFromWishlistEvent event, Emitter<WishlistState> emit) async {
    emit(state.copyWith(
        removeFromWishlistRequestState: WishlistRequestState.loading));
    var res = await removeFromWishlistUsecase.call(event.productId);
    res.fold(
        (failure) => (emit(state.copyWith(
            removeFromWishlistRequestState: WishlistRequestState.error,
            failure: failure))),
        (response) => (emit(state.copyWith(
            wishlistModel: response,
            removeFromWishlistRequestState: WishlistRequestState.loaded))));
  }
}
