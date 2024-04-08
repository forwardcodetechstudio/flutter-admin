import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_admin/core/exceptions/category_exceptions.dart';
import 'package:flutter_admin/core/shared/models/category.dart';
import 'package:flutter_admin/network/api_service.dart';
import 'package:flutter_admin/networking/api_error/basic_api_error.dart';
import 'package:flutter_admin/networking/api_response.dart';
import 'package:flutter_admin/services/interfaces/remote_categories_service.dart';

class RemoteCategoryImpl implements RemoteCategoryService {
  final ApiService apiService;

  RemoteCategoryImpl(this.apiService);

  @override
  Future<ApiResponse> createNewCategory({required String categoryName}) async {
    try {
      final response = await apiService.post(
        '/api/v1/categories/create',
        data: {
          'name': categoryName,
        },
      );
      if (response.data['data'] != null) {
        return ApiResponse(
            data: SingleCategory.fromJson(response.data['data']));
      } else {
        return ApiResponse(
            error: BasicApiError(message: "Unable to get success response"));
      }
    } on Exception catch (e) {
      return ApiResponse(error: BasicApiError(e: e));
    }
  }

  @override
  Future<ApiResponse> deleteCategory({required String categoryId}) async {
    try {
      final response = await apiService.delete(
        '/api/v1/categories/$categoryId',
      );

      if (response.data['data'] != null) {
        return ApiResponse(data: response.data['data'] as bool);
      } else {
        return ApiResponse(
            error: BasicApiError(
                message: "Unable to get successfully deleted response"));
      }
    } on Exception catch (e) {
      return ApiResponse(error: BasicApiError(e: e));
    }
  }

  @override
  Future<ApiResponse> getAllCategory({required int page}) async {
    const bool paginate = true;
    const int pageLength = 10;
    try {
      final Response response = await apiService.get(
        '/api/v1/categories',
        parameters: {
          'paginate': paginate,
          'page': page,
          'page_length': pageLength,
        },
      );
      if (response.data['data'] != null) {
        final CategoryResponse category =
            CategoryResponse.fromJson(response.data['data']);
        return ApiResponse(data: category);
      } else {
        return ApiResponse(
            error: BasicApiError(message: "Unable to get company categories"));
      }
    } on Exception catch (e) {
      return ApiResponse(error: BasicApiError(e: e));
    }
  }

  @override
  Future<ApiResponse> searchCategory({required String text}) async {
    const bool paginate = true;
    const int pageLength = 10;
    try {
      final Response response = await apiService.get(
        '/api/v1/categories',
        parameters: {
          'paginate': paginate,
          'page_length': pageLength,
          'search': text,
        },
      );
      if (response.data['data'] != null) {
        final CategoryResponse category =
            CategoryResponse.fromJson(response.data['data']);
        return ApiResponse(data: category);
      } else {
        return ApiResponse(
            error: BasicApiError(message: "Unable to get company categories"));
      }
    } on Exception catch (e) {
      return ApiResponse(error: BasicApiError(e: e));
    }
  }

  @override
  Future<ApiResponse> updateCategory(
      {required String categoryId, required String categoryName}) async {
    try {
      final response = await apiService.put(
        '/api/v1/categories/$categoryId',
        data: {'name': categoryName},
      );

      if (response.data['data'] != null) {
        return ApiResponse(
            data: SingleCategory.fromJson(response.data['data']));
      } else {
        return ApiResponse(
            error: BasicApiError(
                message: "Unable to get update success response"));
      }
    } on Exception catch (e) {
      return ApiResponse(error: BasicApiError(e: e));
    }
  }
}
