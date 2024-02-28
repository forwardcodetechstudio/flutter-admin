part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class GetCategory extends CategoryEvent {
  final int page;

  const GetCategory({required this.page});
}

class SearchCategory extends CategoryEvent {
  final String text;

  const SearchCategory({required this.text});
}

class RequestCategoryCreation extends CategoryEvent {
  final String categoryName;

  const RequestCategoryCreation({required this.categoryName});
}
