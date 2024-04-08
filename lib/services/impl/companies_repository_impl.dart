import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_admin/model/companies.dart';
import 'package:flutter_admin/network/api_service.dart';
import 'package:flutter_admin/networking/api_error/basic_api_error.dart';
import 'package:flutter_admin/networking/api_response.dart';
import 'package:flutter_admin/services/interfaces/companies_repository.dart';

class CompaniesRepositoryImpl implements CompaniesRepository {
  final ApiService apiService;

  CompaniesRepositoryImpl(this.apiService);

  @override
  Future<ApiResponse> createNewCompany(
      {required Uint8List logo,
      required String companyName,
      required String website,
      required String location,
      required String currency,
      required String phone,
      required double tax,
      required String taxId}) async {
    FormData companyFormData = FormData.fromMap({
      'name': companyName,
      'website': website,
      'location': location,
      'phone': phone,
      'tax': tax,
      'tax_id': taxId,
      'logo': base64Encode(logo), // MultipartFile.fromBytes(logo),
    });

    try {
      final Response response = await apiService
          .post('/api/v1/companies/create', data: companyFormData);

      if (response.data != null) {
        return ApiResponse(data: response.data);
      } else {
        return ApiResponse(
            error: BasicApiError(message: "Unable to get success response"));
      }
    } on Exception catch (e) {
      return ApiResponse(error: BasicApiError(e: e));
    }
  }

  @override
  Future<ApiResponse> getCompaniesData(
      {bool paginate = false,
      int? page,
      int pageLength = 10,
      String? search}) async {
    /**
     * /api/v1/companies?page=1&paginate=true&search=&page_length=10
     */
    try {
      final Response response = await apiService.get(
        '/api/v1/companies',
        parameters: {
          'paginate': paginate,
          'page': page,
          'search': search,
          'page_length': pageLength,
        },
      );
      if (response.data['data'] != null) {
        final Companies companies = Companies.fromJson(response.data['data']);
        return ApiResponse(data: companies);
      } else {
        return ApiResponse(
            error: BasicApiError(message: "Unable to get company data"));
      }
    } on Exception catch (e) {
      return ApiResponse(error: BasicApiError(e: e));
    }
  }
}
