import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/mainScreen/wishlist/data/datasources/wishlist_data_source.dart';
import 'package:ecommerce_pojo/features/mainScreen/wishlist/data/models/wishlist_item_model.dart';
import 'package:ecommerce_pojo/features/mainScreen/wishlist/data/models/wishlist_model.dart';
import 'package:ecommerce_pojo/features/mainScreen/wishlist/domain/repositories/wishlist_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WishlistRepo)
class WishlistRepoImpl implements WishlistRepo {
  final WishlistDataSource wishlistDataSource;
  WishlistRepoImpl(this.wishlistDataSource);
  @override
  Future<Either<Failure, WishlistModel>> addToWishlist(String productId) async {
    var res = await wishlistDataSource.addToWishlist(productId);
    return res.fold((failure) => Left(failure), (response) => Right(response));
  }

  @override
  Future<Either<Failure, WishlistItemModel>> getWishlistItems() async {
    var res = await wishlistDataSource.getWishlistItems();
    return res.fold((failure) => Left(failure), (response) => Right(response));
  }

  @override
  Future<Either<Failure, WishlistModel>> removeFromWishlist(
      String productId) async {
    var res = await wishlistDataSource.removeFromWishlist(productId);
    return res.fold((failure) => Left(failure), (response) => Right(response));
  }
}
