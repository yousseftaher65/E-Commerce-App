import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/mainScreen/cart/data/models/cart_model.dart';
import 'package:ecommerce_pojo/features/mainScreen/cart/domain/repositories/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveFromCartUsecase {
  CartRepo cartRepo;
  RemoveFromCartUsecase(this.cartRepo);

  Future<Either<Failure, CartModel>> call(String productId) => cartRepo.removeFromCart(productId);
}