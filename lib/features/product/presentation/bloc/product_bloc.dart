import 'package:bloc/bloc.dart';
import 'package:ecommerce_pojo/core/errors/failure.dart';
import 'package:ecommerce_pojo/features/product/data/models/product_model.dart';
import 'package:ecommerce_pojo/features/product/domain/usecases/product_details_usecase.dart';
import 'package:ecommerce_pojo/features/product/domain/usecases/product_usecase.dart';
import 'package:injectable/injectable.dart';

part 'product_event.dart';
part 'product_state.dart';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductUsecase productUsecase;
  ProductDetailsUsecase productDetailsUsecase;
  ProductBloc(this.productUsecase, this.productDetailsUsecase)
      : super(ProductInitialState()) {
    on<GetAllProductsEvent>(onGetAllProductsEvent);
    on<GetProductDetailsEvent>(onGetProductDetailsEvent);
  }

  onGetAllProductsEvent(
      GetAllProductsEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(allProductsRequestState: RequestState.loading));
    var res = await productUsecase.call(categoryId: event.categoryId , limit:event.limit);
    res.fold(
        (failure) => emit(state.copyWith(
            allProductsRequestState: RequestState.error, failure: failure)),
        (response) => emit(state.copyWith(
            allProductsRequestState: RequestState.loaded,
            productModel: response,)));
  }

  onGetProductDetailsEvent(
      GetProductDetailsEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(productDetailsRequestState: RequestState.loading));
    var res = await productDetailsUsecase.call(event.productId);
    res.fold(
        (failure) => emit(state.copyWith(
            productDetailsRequestState: RequestState.error, failure: failure)),
        (response) => emit(state.copyWith(
            productDetailsRequestState: RequestState.loaded,
            productData: response)));
  }
}
