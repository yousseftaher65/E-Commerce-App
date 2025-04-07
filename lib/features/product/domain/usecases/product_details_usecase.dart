import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/product/data/models/product_model.dart';
import 'package:ecommerce_pojo/features/product/domain/repositories/product_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailsUsecase {
  final ProductRepo repo;
  ProductDetailsUsecase(this.repo);

  Future<Either<Failure, Data>> call(String productId) => repo.getProductDetails(productId);
}