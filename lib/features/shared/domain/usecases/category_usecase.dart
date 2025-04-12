import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/shared/data/models/category_model.dart';
import 'package:ecommerce_pojo/features/shared/domain/repositories/category_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoryUsecase {
  CategoryRepo categoryRepo;
  CategoryUsecase(this.categoryRepo);
  Future<Either<Failure, CategoryModel>> call() => categoryRepo.getAllCategories();
}