import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/product/data/models/product_model.dart';

abstract class ProductRepo {
  Future<Either<Failure, ProductModel>> getAllProducts({String? categoryId , int? limit});

  Future<Either<Failure, Data>> getProductDetails(String productId);
}
