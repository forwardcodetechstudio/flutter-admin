import 'dart:typed_data';
import 'package:flutter_admin/networking/api_response.dart';

abstract class CompaniesRepository {
  Future<ApiResponse> getCompaniesData({
    bool paginate = false,
    int? page,
    int pageLength = 10,
    String? search,
  });

  Future<ApiResponse> createNewCompany({
    required Uint8List logo,
    required String companyName,
    required String website,
    required String location,
    required String currency,
    required String phone,
    required double tax,
    required String taxId,
  });

  // Future<bool> updateCompany();

  // Future<bool> deleteCompany();
}
