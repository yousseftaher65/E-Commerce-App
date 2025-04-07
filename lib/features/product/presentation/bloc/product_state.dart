part of 'product_bloc.dart';

class ProductState {
  RequestState? allProductsRequestState;
  RequestState? productDetailsRequestState;
  ProductModel? productModel;
  Data? productData;
  Failure? failure;
  ProductState({this.allProductsRequestState, this.productModel, this.failure , this.productDetailsRequestState, this.productData});

  ProductState copyWith({
    RequestState? allProductsRequestState,
    RequestState? productDetailsRequestState,
    ProductModel? productModel,
    Data? productData,
    Failure? failure,
  }) {
    return ProductState(
     allProductsRequestState: allProductsRequestState ?? this.allProductsRequestState,
     productDetailsRequestState: productDetailsRequestState ?? this.productDetailsRequestState,
     productModel: productModel ?? this.productModel,
     productData:  productData ?? this.productData,
     failure: failure ?? this.failure,
    );
  }
}

class ProductInitialState extends ProductState {
  ProductInitialState() : super(allProductsRequestState: RequestState.init , productDetailsRequestState: RequestState.init);
}

enum RequestState {
  /// The request has not started yet.
  init,

  /// The request is currently in progress.
  loading,

  /// The request has completed successfully.
  loaded,

  /// The request has failed with an error.
  error,
}
