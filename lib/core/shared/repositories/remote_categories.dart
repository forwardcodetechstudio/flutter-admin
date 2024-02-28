import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_admin/core/exceptions/category_exceptions.dart';
import 'package:flutter_admin/core/shared/models/category.dart';

class RemoteCategory {
  final Dio client;

  RemoteCategory({required this.client});

  Future<Category> getAllCategory({required int page}) async {
    const bool paginate = true;
    const int pageLength = 10;
    final Response response = await client.get(
      '/api/v1/categories',
      queryParameters: {
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

  Future<Category> searchCategory({required String text}) async {
    const bool paginate = true;
    const int pageLength = 10;
    final Response response = await client.get(
      '/api/v1/categories',
      queryParameters: {
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

  Future<void> createNewCategory({required String categoryName}) async {
    final response = await client.post(
      '/api/v1/categories/create',
      data: {'name': categoryName},
    );
    if (response.statusCode == HttpStatus.ok) {
      // return Category.fromJson(response.data);
      return;
    }
    throw CategoryNotCreated();
  }
}
