import 'dart:typed_data';
import 'package:flutter_admin/network/api_service.dart';
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
    return ApiResponse(data: []);
  }

  @override
  Future<ApiResponse> getCompaniesData(
      {bool paginate = false,
      int? page,
      int pageLength = 10,
      String? search}) async {
    return ApiResponse(data: "");
  }
}
