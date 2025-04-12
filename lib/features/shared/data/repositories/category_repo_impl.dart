import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/shared/data/datasources/category_data_source.dart';
import 'package:ecommerce_pojo/features/shared/data/models/category_model.dart';
import 'package:ecommerce_pojo/features/shared/data/models/sub_category_model.dart';
import 'package:ecommerce_pojo/features/shared/domain/repositories/category_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoryRepo)
class CategoryRepoImpl extends CategoryRepo {
  CategoryDataSource categoryDS;
  CategoryRepoImpl(this.categoryDS);
  @override
  Future<Either<Failure, CategoryModel>> getAllCategories() async {
    var res = await categoryDS.getAllCategories();
    return res.fold((failure) => Left(failure), (response) => Right(response));
  }

  @override
  Future<Either<Failure, SubCategoryModel>> getSubCategories(String categoryId) async{
   var res = await categoryDS.getSubCategories(categoryId);
    return res.fold((failure) => Left(failure), (response) => Right(response));
  }
}
