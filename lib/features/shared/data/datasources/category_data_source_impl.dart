import 'package:dartz/dartz.dart';
import 'package:ecommerce_pojo/core/api/api_manager.dart';
import 'package:ecommerce_pojo/core/api/end_points.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/shared/data/datasources/category_data_source.dart';
import 'package:ecommerce_pojo/features/shared/data/models/category_model.dart';
import 'package:ecommerce_pojo/features/shared/data/models/sub_category_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoryDataSource)
class CategoryDataSourceImpl extends CategoryDataSource {
  ApiManager apiManager;
  CategoryDataSourceImpl(this.apiManager);
  @override
  Future<Either<Failure, CategoryModel>> getAllCategories() async{
  
    try {
       var res = await apiManager.getRequest(endPoint: EndPoints.categories);
    if (res.statusCode! >= 200 && res.statusCode! < 300) {
      return Right(CategoryModel.fromJson(res.data));
    } else {
      return Left(ServerFailure(res.data['message'] ?? 'Unknown error occurred'));
    }
    } catch (e) {
      if(e.toString().contains('connection')){
       return Left(NetworkFailure('Please Check Your Internet Connection'));
     }
     return Left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, SubCategoryModel>> getSubCategories(String categoryId) async{
    try {
      var res = await apiManager.getRequest(endPoint: EndPoints.subcategoriesByCategory(categoryId));
    if (res.statusCode! >= 200 && res.statusCode! < 300) {
      return Right(SubCategoryModel.fromJson(res.data));
    } else {
      return Left(ServerFailure(res.data['message'] ?? 'Unknown error occurred'));
    }
    }catch(e){
      if(e.toString().contains('connection')){
       return Left(NetworkFailure('Please Check Your Internet Connection'));
     }
     return Left(ServerFailure(e.toString()));
    }
  }
}
