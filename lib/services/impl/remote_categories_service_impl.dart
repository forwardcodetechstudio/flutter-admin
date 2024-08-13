import 'package:flutter_admin/network/api_service.dart';
import 'package:flutter_admin/networking/api_response.dart';
import 'package:flutter_admin/services/interfaces/remote_categories_service.dart';

class RemoteCategoryImpl implements RemoteCategoryService {
  final ApiService apiService;

  RemoteCategoryImpl(this.apiService);

  @override
  Future<ApiResponse> createNewCategory({required String categoryName}) async {
    return ApiResponse(data: "");
  }

  @override
  Future<ApiResponse> deleteCategory({required String categoryId}) async {
    return ApiResponse(data: "");
  }

  @override
  Future<ApiResponse> getAllCategory({required int page}) async {
    return ApiResponse(data: []);
  }

  @override
  Future<ApiResponse> searchCategory({required String text}) async {
    return ApiResponse(data: []);
  }

  @override
  Future<ApiResponse> updateCategory(
      {required String categoryId, required String categoryName}) async {
    return ApiResponse(data: []);
  }
}
