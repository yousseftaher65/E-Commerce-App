import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/api/api_manager.dart';
import 'package:ecommerce_pojo/core/api/end_points.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/core/helpers/shared_preference.dart';
import 'package:ecommerce_pojo/features/mainScreen/cart/data/datasources/cart_data_source.dart';
import 'package:ecommerce_pojo/features/mainScreen/cart/data/models/cart_item_model.dart';
import 'package:ecommerce_pojo/features/mainScreen/cart/data/models/cart_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartDataSource)
class CartDataSourceImpl implements CartDataSource {
  ApiManager apiManager;
  CartDataSourceImpl(this.apiManager);
  @override
  Future<Either<Failure, CartModel>> addToCart(String productId) async {
    try {
      String token = SharedPreferenceHelper.getString('token') ?? '';
      var res = await apiManager.postRequest(endPoint: EndPoints.cart, body: {
        'productId': productId,
      }, headers: {
        'token': token
      });

      if (res.statusCode! >= 200 && res.statusCode! < 300) {
        return Right(CartModel.fromJson(res.data));
      } else {
        return Left(
            ServerFailure(res.data['message'] ?? 'Unknown error occurred'));
      }
    } catch (e) {
      if (e.toString().contains('connection')) {
        return Left(NetworkFailure('Please Check Your Internet Connection'));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartModel>> clearCart() {
    // TODO: implement clearCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CartItemModel>> getCartItems() async {
    try {
      String token = SharedPreferenceHelper.getString('token') ?? '';
      var res = await apiManager.getRequest(endPoint: EndPoints.cart, headers: {
        'token': token
      });

      if (res.statusCode! >= 200 && res.statusCode! < 300) {
        return Right(CartItemModel.fromJson(res.data));
      } else {
        return Left(
            ServerFailure(res.data['message'] ?? 'Unknown error occurred'));
      }
    } catch (e) {
      if (e.toString().contains('connection')) {
        return Left(NetworkFailure('Please Check Your Internet Connection'));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartModel>> removeFromCart(String productId) async{
     try {
      String token = SharedPreferenceHelper.getString('token') ?? '';
      var res = await apiManager.deleteRequest(endPoint: "${EndPoints.cart}/$productId", headers: {
        'token': token
      });

      if (res.statusCode! >= 200 && res.statusCode! < 300) {
        return Right(CartModel.fromJson(res.data));
      } else {
        return Left(
            ServerFailure(res.data['message'] ?? 'Unknown error occurred'));
      }
    } catch (e) {
      if (e.toString().contains('connection')) {
        return Left(NetworkFailure('Please Check Your Internet Connection'));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
