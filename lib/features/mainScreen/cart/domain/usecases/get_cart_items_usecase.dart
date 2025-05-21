import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/mainScreen/cart/data/models/cart_item_model.dart';
import 'package:ecommerce_pojo/features/mainScreen/cart/domain/repositories/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCartItemsUsecase {
  CartRepo cartRepo;
  GetCartItemsUsecase(this.cartRepo);

  Future<Either<Failure, CartItemModel>> call() => cartRepo.getCartItems();
}