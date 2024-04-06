import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_admin/model/companies.dart';
import 'package:flutter_admin/network/api_service.dart';
import 'package:flutter_admin/services/interfaces/companies_repository.dart';

class CompaniesRepositoryImpl implements CompaniesRepository {
  final ApiService apiService;

  CompaniesRepositoryImpl(this.apiService);

  @override
  Future<bool> createNewCompany(
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

    final Response response = await apiService.post('/api/v1/companies/create',
        data: companyFormData);

    if (response.statusCode == HttpStatus.ok) {
      return true;
    }
    throw Exception();
  }

  @override
  Future<Companies> getCompaniesData(
      {bool paginate = false,
      int? page,
      int pageLength = 10,
      String? search}) async {
    /**
     * /api/v1/companies?page=1&paginate=true&search=&page_length=10
     */
    final Response response = await apiService.get(
      '/api/v1/companies',
      parameters: {
        'paginate': paginate,
        'page': page,
        'search': search,
        'page_length': pageLength,
      },
    );
    if (response.statusCode == HttpStatus.ok) {
      final Companies companies = Companies.fromJson(response.data['data']);
      return companies;
    }

    throw Exception();
  }
}
