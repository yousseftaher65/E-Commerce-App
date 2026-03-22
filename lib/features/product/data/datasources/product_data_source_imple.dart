import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/api/api_manager.dart';
import 'package:ecommerce_pojo/core/api/end_points.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/product/data/datasources/product_data_source.dart';
import 'package:ecommerce_pojo/features/product/data/models/product_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDataSource)
class ProductDataSourceImple extends ProductDataSource {
  ApiManager apiManager;
  ProductDataSourceImple({required this.apiManager});
  @override
  Future<Either<Failure, ProductModel>> getAllProducts({String? categoryId , int? limit}) async{
   try{
     var res = await apiManager.getRequest(endPoint: EndPoints.products , params:{ if(categoryId != null ) 'category[in]' : categoryId, if(limit != null) 'limit' : limit});
     if(res.statusCode! >= 200 && res.statusCode! < 300){
       return Right(ProductModel.fromJson(res.data));
     }else{
       return Left(ServerFailure(res.data['message'] ?? 'Unknown error occurred'));
     }
   }catch(e){
     if(e.toString().contains('connection')){
       return Left(NetworkFailure('Please Check Your Internet Connection'));
     }
     return Left(ServerFailure(e.toString()));
   }
  }
  
  @override
  Future<Either<Failure, Data>> getProductDetails(String productId) async{
    try {
      var res = await apiManager.getRequest(endPoint: '${EndPoints.products}/$productId');
      if (res.statusCode! >= 200 && res.statusCode! < 300) {
       final productData = res.data['data'];
        return Right(Data.fromJson(productData));
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
