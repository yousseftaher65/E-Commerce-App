import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/mainScreen/wishlist/data/models/wishlist_item_model.dart';
import 'package:ecommerce_pojo/features/mainScreen/wishlist/domain/repositories/wishlist_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetWishlistItemsUsecase {
  WishlistRepo wishlistRepo;
  GetWishlistItemsUsecase(this.wishlistRepo);
  Future<Either<Failure, WishlistItemModel>> call() =>
      wishlistRepo.getWishlistItems();
}
