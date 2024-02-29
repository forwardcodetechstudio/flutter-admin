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
    on<RequestCategoryDeleation>(_removeCategory);
    on<RequestCategoryUpdation>(_updateCategory);
  }

  void _createNewCategory(
      RequestCategoryCreation event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    try {
      await remoteCategory.createNewCategory(categoryName: event.categoryName);
      emit(const CategoryCreated());
    } on CategoryCreationFailure {
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

  void _updateCategory(
      RequestCategoryUpdation event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    try {
      final bool isCategoryUpdated = await remoteCategory.updateCategory(
        categoryId: event.categoryId,
        categoryName: event.categoryName,
      );
      if (isCategoryUpdated) {
        emit(const CategoryUpdated());
      } else {
        emit(const CategoryUpdationFailed());
      }
    } on CategoryCreationFailure {
      emit(const CategoryUpdationFailed());
    } catch (e) {
      emit(const CategoryUpdationFailed());
    }
  }

  void _removeCategory(
      RequestCategoryDeleation event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    try {
      bool isCategoryDeleted = await remoteCategory.deleteCategory(
        categoryId: event.categoryId,
      );
      if (isCategoryDeleted) {
        emit(const CategoryRemoved());
      } else {
        emit(const CategoryRemovingFalied());
      }
    } catch (e) {
      emit(const CategoryRemovingFalied());
    }
  }
}
