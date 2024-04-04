import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_admin/model/companies.dart';
import 'package:flutter_admin/services/impl/companies_repository_impl.dart';

abstract class CompaniesRepository {
  factory CompaniesRepository(Dio client) =>
      CompaniesRepositoryImpl(client: client);

  Future<Companies> getCompaniesData({
    bool paginate = false,
    int? page,
    int pageLength = 10,
    String? search,
  });

  Future<bool> createNewCompany({
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
