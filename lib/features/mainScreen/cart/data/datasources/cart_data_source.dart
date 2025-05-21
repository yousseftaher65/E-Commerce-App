import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/mainScreen/cart/data/models/cart_item_model.dart';
import 'package:ecommerce_pojo/features/mainScreen/cart/data/models/cart_model.dart';

abstract class CartDataSource {
  Future<Either<Failure, CartModel>> addToCart(String productId);
  Future<Either<Failure, CartModel>> removeFromCart(String productId);
  Future<Either<Failure, CartItemModel>> getCartItems();
  Future<Either<Failure, CartModel>> clearCart();
}