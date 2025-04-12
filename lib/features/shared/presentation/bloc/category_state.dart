part of 'category_bloc.dart';

class CategoryState {
  final CategoryModel? categoryModel;
  final SubCategoryModel? subCategoryModel;
  final RequestState? getSubCategoriesRequestState;
  final  RequestState? getAllCategoriesRequestState;
  final Failure? failure;
  CategoryState({this.categoryModel, this.getAllCategoriesRequestState =  RequestState.initial, this.failure , this.subCategoryModel , this.getSubCategoriesRequestState});

  CategoryState copyWith({
    CategoryModel? categoryModel,
    SubCategoryModel? subCategoryModel,
    RequestState? getSubCategoriesRequestState,
    RequestState? getAllCategoriesRequestState,
    Failure? failure,
  }) {
    return CategoryState(
      categoryModel: categoryModel ?? this.categoryModel,
      subCategoryModel: subCategoryModel?? this.subCategoryModel,
      getSubCategoriesRequestState: getSubCategoriesRequestState?? this.getSubCategoriesRequestState,
      getAllCategoriesRequestState: getAllCategoriesRequestState?? this.getAllCategoriesRequestState,
      failure: failure?? this.failure,
    );
  }
}

class CategoryInitial extends CategoryState {
  CategoryInitial() : super(getAllCategoriesRequestState:  RequestState.initial, getSubCategoriesRequestState:  RequestState.initial); 
}

enum  RequestState {
  initial,
  loading,
  loaded,
  error,
}
