import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_admin/features/company/models/companies.dart';

class CompaniesRepository {
  final Dio client;

  CompaniesRepository({required this.client});

  Future<Companies> getCompaniesData({
    bool paginate = false,
    int? page,
    int pageLength = 10,
    String? search,
  }) async {
    /**
     * /api/v1/companies?page=1&paginate=true&search=&page_length=10
     */
    final Response response = await client.get(
      '/api/v1/companies',
      queryParameters: {
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

  Future<bool> createNewCompany({
    required Uint8List logo,
    required String companyName,
    required String website,
    required String location,
    required String currency,
    required String phone,
    required double tax,
    required String taxId,
  }) async {
    /**
     * /api/v1/companies/create
     * {
     *    name: '',
     *    website: '',
     *    logo: '',
     *    location: '',
     *    phone: '',
     *    tax: '',
     *    tax_id: '',
     * }
     */

    FormData companyFormData = FormData.fromMap({
      'name': companyName,
      'website': website,
      'location': location,
      'phone': phone,
      'tax': tax,
      'tax_id': taxId,
      'logo': MultipartFile.fromBytes(logo),
    });

    final Response response =
        await client.post('/api/v1/companies/create', data: companyFormData);

    if (response.statusCode == HttpStatus.ok) {
      return true;
    }
    throw Exception();
  }

  Future<bool> updateCompany() {
    /**
     * /api/v1/companies/company_id
     * {
     *    name: '',
     * }
     */

    throw Exception();
  }

  Future<bool> deleteCompany() {
    /**
     * /api/v1/companies/company_id
     */

    throw Exception();
  }
}
