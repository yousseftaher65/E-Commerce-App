import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/product/data/models/product_model.dart';

abstract class ProductDataSource {
 Future<Either<Failure, ProductModel>> getAllProducts({String? categoryId , int? limit}); /// using category id here as sub category id (backend issue)
 Future<Either<Failure, Data>> getProductDetails(String productId);
}
