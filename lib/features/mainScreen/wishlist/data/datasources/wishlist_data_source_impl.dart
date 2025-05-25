import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/api/api_manager.dart';
import 'package:ecommerce_pojo/core/api/end_points.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/core/helpers/shared_preference.dart';
import 'package:ecommerce_pojo/features/mainScreen/wishlist/data/datasources/wishlist_data_source.dart';
import 'package:ecommerce_pojo/features/mainScreen/wishlist/data/models/wishlist_item_model.dart';
import 'package:ecommerce_pojo/features/mainScreen/wishlist/data/models/wishlist_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WishlistDataSource)
class WishlistDataSourceImpl implements WishlistDataSource {
  final ApiManager apiManager;
  WishlistDataSourceImpl(this.apiManager);
  @override
  Future<Either<Failure, WishlistModel>> addToWishlist(String productId) async {
    final token = SharedPreferenceHelper.getString('token') ?? '';
    try {
      var res =
          await apiManager.postRequest(endPoint: EndPoints.wishlist, body: {
        'productId': productId,
      }, headers: {
        'token': token,
      });
      if (res.statusCode! >= 200 && res.statusCode! < 300) {
        return Right(WishlistModel.fromJson(res.data));
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
  Future<Either<Failure, WishlistModel>> removeFromWishlist(
      String productId) async {
    final token = SharedPreferenceHelper.getString('token') ?? '';
    try {
      var res = await apiManager.deleteRequest(
        endPoint: "${EndPoints.wishlist}/$productId",
        headers: {'token': token},
      );
      if (res.statusCode! >= 200 && res.statusCode! < 300) {
        return Right(WishlistModel.fromJson(res.data));
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
  Future<Either<Failure, WishlistItemModel>> getWishlistItems() async {
    try {
      String token = SharedPreferenceHelper.getString('token') ?? '';
      var res = await apiManager
          .getRequest(endPoint: EndPoints.wishlist, headers: {'token': token});

      if (res.statusCode! >= 200 && res.statusCode! < 300) {
        return Right(WishlistItemModel.fromJson(res.data));
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
