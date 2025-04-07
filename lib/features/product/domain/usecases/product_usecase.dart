import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/product/data/models/product_model.dart';
import 'package:ecommerce_pojo/features/product/domain/repositories/product_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductUsecase {
  ProductRepo productRepo;
  ProductUsecase(this.productRepo);

  Future<Either<Failure, ProductModel>> call({String? categoryId , int? limit}) => productRepo.getAllProducts(categoryId: categoryId , limit:limit);
}
