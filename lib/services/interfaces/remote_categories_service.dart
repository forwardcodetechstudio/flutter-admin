import 'package:flutter_admin/networking/api_response.dart';

abstract class RemoteCategoryService {
  Future<ApiResponse> getAllCategory({required int page});

  Future<ApiResponse> searchCategory({required String text});

  Future<ApiResponse> createNewCategory({required String categoryName});

  Future<ApiResponse> updateCategory(
      {required String categoryId, required String categoryName});

  Future<ApiResponse> deleteCategory({required String categoryId});
}
