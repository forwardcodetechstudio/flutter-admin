import 'package:equatable/equatable.dart';
import 'package:flutter_admin/features/tables/repositories/remote_categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_admin/features/tables/models/category.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final RemoteCategory remoteCategory;
  static const String baseUrl = 'dev.anbocas.com';

  CategoryBloc(this.remoteCategory) : super(CategoryInitial()) {
    on<GetCategory>(_getAllCategories);
  }

  void _getAllCategories(
      GetCategory event, Emitter<CategoryState> emit) async {
    emit(CategoryFetching());
    try {
      Category? category = await remoteCategory.getAllCategories();
      if (category != null) {
        emit(CategoryFetchingSucceeded(categories: category));
      } else {
        emit(const CategoryFetchingFailure(exception: '404 Not Found'));
      }
    } catch (e) {
      emit(CategoryFetchingFailure(exception: e.toString()));
    }
  }
}
