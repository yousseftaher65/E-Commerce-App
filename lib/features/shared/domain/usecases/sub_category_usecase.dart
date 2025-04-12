import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/shared/data/models/sub_category_model.dart';
import 'package:ecommerce_pojo/features/shared/domain/repositories/category_repo.dart';
import 'package:injectable/injectable.dart';


@injectable
class SubCategoryUsecase {
  CategoryRepo categoryRepo;

  SubCategoryUsecase(this.categoryRepo);

  Future<Either<Failure, SubCategoryModel>> call(String categoryId) =>
      categoryRepo.getSubCategories(categoryId);
}
