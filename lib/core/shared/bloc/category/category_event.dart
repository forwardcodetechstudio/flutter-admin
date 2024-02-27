part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class GetCategory extends CategoryEvent {}

class RequestCategoryCreation extends CategoryEvent {
  final String categoryName;

  const RequestCategoryCreation({required this.categoryName});
}
