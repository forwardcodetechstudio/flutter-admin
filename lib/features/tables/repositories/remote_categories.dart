import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_admin/core/exceptions/category_exceptions.dart';
import 'package:flutter_admin/features/tables/models/category.dart';

class RemoteCategory {
  final Dio client;

  RemoteCategory({required this.client});

  Future<Category> getAllCategory() async {
    const bool paginate = false;
    final Response response = await client.get(
      '/api/v1/categories',
      queryParameters: {'paginate': paginate},
    );

    if (response.statusCode == HttpStatus.ok) {
      final Category category = Category.fromJson(response.data);
      return category;
    }

    throw CategoryNotFound();
  }
}
