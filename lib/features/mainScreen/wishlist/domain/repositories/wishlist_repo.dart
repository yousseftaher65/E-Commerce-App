import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/mainScreen/wishlist/data/models/wishlist_item_model.dart';
import 'package:ecommerce_pojo/features/mainScreen/wishlist/data/models/wishlist_model.dart';

abstract class WishlistRepo {
  Future<Either<Failure, WishlistModel>> addToWishlist(String productId);
  Future<Either<Failure, WishlistModel>> removeFromWishlist(String productId);
  Future<Either<Failure, WishlistItemModel>> getWishlistItems();
}