import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/shared/data/models/category_model.dart';
import 'package:ecommerce_pojo/features/shared/data/models/sub_category_model.dart';

abstract class CategoryDataSource {
  Future<Either<Failure, CategoryModel>> getAllCategories();
  Future<Either<Failure, SubCategoryModel>> getSubCategories(String categoryId);
}
