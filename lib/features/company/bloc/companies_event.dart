// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'companies_bloc.dart';

sealed class CompaniesEvent extends Equatable {
  const CompaniesEvent();

  @override
  List<Object> get props => [];
}

class RequestForCompaniesData extends CompaniesEvent {
  final bool paginate;
  final int? page;
  final int pageLength;
  final String? search;

  const RequestForCompaniesData({
    this.paginate = false,
    this.page,
    this.pageLength = 10,
    this.search,
  });
}

class SearchCompany extends CompaniesEvent {}

class RequestForNewCompanyCreation extends CompaniesEvent {
  final Uint8List logo;
  final String name;
  final String website;
  final String location;
  final String currency;
  final String phone;
  final double tax;
  final String taxId;

  const RequestForNewCompanyCreation({
    required this.logo,
    required this.name,
    required this.website,
    required this.location,
    required this.currency,
    required this.phone,
    required this.tax,
    required this.taxId,
  });
}

class RequestForCompanyUpdation extends CompaniesEvent {}

class RequestForCompanyDeletion extends CompaniesEvent {}
