import 'package:equatable/equatable.dart';
import 'package:flutter_admin/core/exceptions/category_exceptions.dart';
import 'package:flutter_admin/core/shared/repositories/remote_categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_admin/core/shared/models/category.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final RemoteCategory remoteCategory;

  CategoryBloc(this.remoteCategory) : super(CategoryInitial()) {
    on<GetCategory>(_getAllCategories);
    on<RequestCategoryCreation>(_createNewCategory);
    on<SearchCategory>(_searchCategories);
  }

  void _createNewCategory(
      RequestCategoryCreation event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    try {
      await remoteCategory.createNewCategory(categoryName: event.categoryName);
      emit(const CategoryCreated());
    } on CategoryNotCreated {
      emit(const CategoryCreationFailed(exception: 'Category Not Created'));
    } catch (e) {
      emit(const CategoryCreationFailed(exception: 'Category Not Created'));
    }
  }

  void _getAllCategories(GetCategory event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    try {
      Category category = await remoteCategory.getAllCategory(page: event.page);
      emit(CategoryFetchingSucceeded(categories: category));
    } on CategoryNotFound {
      emit(const CategoryFetchingFailure(exception: 'Category Not Found'));
    } catch (e) {
      emit(CategoryFetchingFailure(exception: e.toString()));
    }
  }

  void _searchCategories(
      SearchCategory event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    try {
      Category category = await remoteCategory.searchCategory(
        text: event.text,
      );
      emit(CategoryFetchingSucceeded(categories: category));
    } on CategoryNotFound {
      emit(const CategoryFetchingFailure(exception: 'Category Not Found'));
    } catch (e) {
      emit(CategoryFetchingFailure(exception: e.toString()));
    }
  }
}
