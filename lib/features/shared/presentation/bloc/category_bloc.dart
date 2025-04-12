import 'package:bloc/bloc.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/shared/data/models/category_model.dart';
import 'package:ecommerce_pojo/features/shared/data/models/sub_category_model.dart';
import 'package:ecommerce_pojo/features/shared/domain/usecases/category_usecase.dart';
import 'package:ecommerce_pojo/features/shared/domain/usecases/sub_category_usecase.dart';
import 'package:injectable/injectable.dart';

part 'category_event.dart';
part 'category_state.dart';

@injectable
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryUsecase categoryUsecase;
  SubCategoryUsecase subCategoryUsecase;
  CategoryBloc(this.categoryUsecase , this.subCategoryUsecase) : super(CategoryInitial()) {
    on<GetAllCategoriesEvent>(onGetAllCategories);
    on<GetSubCategoriesEvent>(onGetSubCategoriesEvent);
  }

  onGetAllCategories(
      GetAllCategoriesEvent event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(getAllCategoriesRequestState:  RequestState.loading));
    var res = await categoryUsecase.call();
    res.fold(
        (failure) => (emit(state.copyWith(
            getAllCategoriesRequestState:  RequestState.error,
            failure: failure))),
        (response) => (emit(state.copyWith(
            categoryModel: response,
            getAllCategoriesRequestState:  RequestState.loaded))));
  }

  onGetSubCategoriesEvent(GetSubCategoriesEvent event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(getSubCategoriesRequestState:  RequestState.loading));
    var res = await subCategoryUsecase.call(event.categoryId);
    return res.fold(
        (failure) => (emit(state.copyWith(
            getSubCategoriesRequestState:  RequestState.error,
            failure: failure))),
        (response) => (emit(state.copyWith(
            subCategoryModel: response,
            getSubCategoriesRequestState:  RequestState.loaded))));
  }
}
