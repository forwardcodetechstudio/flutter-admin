import 'package:equatable/equatable.dart';
import 'package:flutter_admin/base/base_bloc.dart';
import 'package:flutter_admin/core/shared/models/category.dart';
import 'package:flutter_admin/networking/api_response.dart';
import 'package:flutter_admin/services/interfaces/remote_categories_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends BaseBloc<CategoryEvent, CategoryState> {
  final RemoteCategoryService remoteCategory;

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
    final ApiResponse resp = await remoteCategory.createNewCategory(
        categoryName: event.categoryName);
    if (resp.data != null && resp.data is SingleCategory) {
      emit(const CategoryCreated());
    } else {
      emit(const CategoryCreationFailed(exception: 'Category Not Created'));
    }
  }

  void _getAllCategories(GetCategory event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    ApiResponse resp = await remoteCategory.getAllCategory(page: event.page);
    if (resp.data != null && resp.data is CategoryResponse) {
      emit(CategoryFetchingSucceeded(categories: resp.data));
    } else {
      emit(CategoryFetchingFailure(exception: resp.error?.errorMsg));
    }
  }

  void _searchCategories(
      SearchCategory event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());

    ApiResponse resp = await remoteCategory.searchCategory(
      text: event.text,
    );
    if (resp.data != null && resp.data is CategoryResponse) {
      emit(CategoryFetchingSucceeded(categories: resp.data));
    } else {
      emit(CategoryFetchingFailure(exception: resp.error?.errorMsg));
    }
  }

  void _updateCategory(
      RequestCategoryUpdation event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    final ApiResponse resp = await remoteCategory.updateCategory(
      categoryId: event.categoryId,
      categoryName: event.categoryName,
    );

    if (resp.data != null && resp.data is SingleCategory) {
      emit(const CategoryUpdated());
    } else {
      emit(const CategoryUpdationFailed());
    }
  }

  void _removeCategory(
      RequestCategoryDeleation event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    ApiResponse resp = await remoteCategory.deleteCategory(
      categoryId: event.categoryId,
    );

    if (resp.data != null) {
      final bool isRemoved = resp.data is bool;
      if (isRemoved == true) {
        emit(const CategoryRemoved());
      } else {
        emit(const CategoryRemovingFalied());
      }
    } else {}
  }
}
