part of 'category_bloc.dart';

abstract class CategoryEvent {}

class GetAllCategoriesEvent extends CategoryEvent {
  GetAllCategoriesEvent();
}
class GetSubCategoriesEvent extends CategoryEvent {
  final String categoryId;
  GetSubCategoriesEvent({required this.categoryId});
}
