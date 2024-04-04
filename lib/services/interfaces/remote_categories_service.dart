import 'package:dio/dio.dart';
import 'package:flutter_admin/core/shared/models/category.dart';
import 'package:flutter_admin/services/impl/remote_categories_service_impl.dart';

abstract class RemoteCategoryService {
  factory RemoteCategoryService(Dio client) =>
      RemoteCategoryImpl(client: client);

  Future<Category> getAllCategory({required int page});

  Future<Category> searchCategory({required String text});

  Future<void> createNewCategory({required String categoryName});

  Future<bool> updateCategory(
      {required String categoryId, required String categoryName});

  Future<bool> deleteCategory({required String categoryId});
}
