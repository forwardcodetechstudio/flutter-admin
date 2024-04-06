import 'package:flutter_admin/core/shared/models/category.dart';

abstract class RemoteCategoryService {
  Future<Category> getAllCategory({required int page});

  Future<Category> searchCategory({required String text});

  Future<void> createNewCategory({required String categoryName});

  Future<bool> updateCategory(
      {required String categoryId, required String categoryName});

  Future<bool> deleteCategory({required String categoryId});
}
