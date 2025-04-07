import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/product/data/datasources/product_data_source.dart';
import 'package:ecommerce_pojo/features/product/data/models/product_model.dart';
import 'package:ecommerce_pojo/features/product/domain/repositories/product_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepo)
class ProductRepoImple extends ProductRepo {
  ProductDataSource productDS;

  ProductRepoImple(this.productDS);
  @override
  Future<Either<Failure, ProductModel>> getAllProducts({String? categoryId ,int? limit}) async{
   var res = await productDS.getAllProducts(limit: limit , categoryId: categoryId);
   return res.fold((failure)=> Left(failure), (response) => Right(response));
  }

  
  @override
  Future<Either<Failure, Data>> getProductDetails(String productId) async{
    var res = await productDS.getProductDetails(productId);
    return res.fold((failure)=> Left(failure), (response) => Right(response));
  }
}
