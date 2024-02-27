import 'package:equatable/equatable.dart';
import 'package:flutter_admin/core/exceptions/category_exceptions.dart';
import 'package:flutter_admin/features/tables/repositories/remote_categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_admin/features/tables/models/category.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final RemoteCategory remoteCategory;

  CategoryBloc(this.remoteCategory) : super(CategoryInitial()) {
    on<GetCategory>(_getAllCategories);
  }

  void _getAllCategories(GetCategory event, Emitter<CategoryState> emit) async {
    emit(CategoryFetching());
    try {
      Category category = await remoteCategory.getAllCategory();
      emit(CategoryFetchingSucceeded(categories: category));
    } on CategoryNotFound {
      emit(const CategoryFetchingFailure(exception: 'Category Not Found'));
    } catch (e) {
      emit(CategoryFetchingFailure(exception: e.toString()));
    }
  }
}
