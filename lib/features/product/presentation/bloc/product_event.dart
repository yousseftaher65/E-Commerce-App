part of 'product_bloc.dart';

abstract class ProductEvent {}

class GetProductDetailsEvent extends ProductEvent {
  final String productId;
  GetProductDetailsEvent(this.productId);
}

class GetAllProductsEvent extends ProductEvent {
  final String? categoryId;
  final int? limit;
  GetAllProductsEvent({this.categoryId , this.limit});
}
