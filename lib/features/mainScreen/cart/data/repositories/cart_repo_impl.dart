import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/mainScreen/cart/data/datasources/cart_data_source.dart';
import 'package:ecommerce_pojo/features/mainScreen/cart/data/models/cart_item_model.dart';
import 'package:ecommerce_pojo/features/mainScreen/cart/data/models/cart_model.dart';
import 'package:ecommerce_pojo/features/mainScreen/cart/domain/repositories/cart_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepo)
class CartRepoImpl implements CartRepo {
  CartDataSource cartDataSource;
  CartRepoImpl(this.cartDataSource);
  @override
  Future<Either<Failure, CartModel>> addToCart(String productId) async {
    var res = await cartDataSource.addToCart(productId);
    return res.fold((failure) => Left(failure), (response) => Right(response));
  }

  @override
  Future<Either<Failure, CartItemModel>> getCartItems() async {
    var res = await cartDataSource.getCartItems();
    return res.fold((failure) => Left(failure), (response) => Right(response));
  }
  
  @override
  Future<Either<Failure, CartModel>> removeFromCart(String productId) async{
    var res = await cartDataSource.removeFromCart(productId);
    return res.fold((failure) => Left(failure), (response) => Right(response));
  }
}
