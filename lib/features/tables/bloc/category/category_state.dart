part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  final Category? categories;
  final String? exception;
  const CategoryState({this.categories, this.exception});

  @override
  List<Object?> get props => [categories, exception];
}

final class CategoryInitial extends CategoryState {}

final class CategoryFetching extends CategoryState {}

final class CategoryFetchingSucceeded extends CategoryState {
  const CategoryFetchingSucceeded({required super.categories});
}

final class CategoryFetchingFailure extends CategoryState {
  const CategoryFetchingFailure({required super.exception});
}
