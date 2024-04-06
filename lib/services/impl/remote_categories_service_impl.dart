import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_admin/core/exceptions/category_exceptions.dart';
import 'package:flutter_admin/core/shared/models/category.dart';
import 'package:flutter_admin/network/api_service.dart';
import 'package:flutter_admin/services/interfaces/remote_categories_service.dart';

class RemoteCategoryImpl implements RemoteCategoryService {
  final ApiService apiService;

  RemoteCategoryImpl(this.apiService);

  @override
  Future<void> createNewCategory({required String categoryName}) async {
    final response = await apiService.post(
      '/api/v1/categories/create',
      data: {
        'name': categoryName,
      },
    );
    if (response.statusCode == HttpStatus.ok) {
      // return Category.fromJson(response.data);
      return;
    }
    throw CategoryCreationFailure();
  }

  @override
  Future<bool> deleteCategory({required String categoryId}) async {
    final response = await apiService.delete(
      '/api/v1/categories/$categoryId',
    );
    if (response.statusCode == HttpStatus.ok) {
      return response.data['data'];
    }
    throw CategoryDeleationFailure();
  }

  @override
  Future<Category> getAllCategory({required int page}) async {
    const bool paginate = true;
    const int pageLength = 10;
    final Response response = await apiService.get(
      '/api/v1/categories',
      parameters: {
        'paginate': paginate,
        'page': page,
        'page_length': pageLength,
      },
    );

    if (response.statusCode == HttpStatus.ok) {
      final Category category = Category.fromJson(response.data);
      return category;
    }

    throw CategoryNotFound();
  }

  @override
  Future<Category> searchCategory({required String text}) async {
    const bool paginate = true;
    const int pageLength = 10;
    final Response response = await apiService.get(
      '/api/v1/categories',
      parameters: {
        'paginate': paginate,
        'page_length': pageLength,
        'search': text,
      },
    );

    if (response.statusCode == HttpStatus.ok) {
      final Category category = Category.fromJson(response.data);
      return category;
    }
    throw CategoryNotFound();
  }

  @override
  Future<bool> updateCategory(
      {required String categoryId, required String categoryName}) async {
    final response = await apiService.put(
      '/api/v1/categories/$categoryId',
      data: {'name': categoryName},
    );
    if (response.statusCode == HttpStatus.ok) {
      // return Category.fromJson(response.data);
      return true;
    }
    throw CategoryUpdationFailure();
  }
}
