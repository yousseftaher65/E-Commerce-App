import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/mainScreen/wishlist/data/models/wishlist_model.dart';
import 'package:ecommerce_pojo/features/mainScreen/wishlist/domain/repositories/wishlist_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveFromWishlistUsecase {
  WishlistRepo wishlistRepo;

  RemoveFromWishlistUsecase(this.wishlistRepo);

  Future<Either<Failure, WishlistModel>> call(String productId) =>
      wishlistRepo.removeFromWishlist(productId);
}
