import 'dart:typed_data';
import 'package:flutter_admin/base/base_bloc.dart';
import 'package:flutter_admin/model/companies.dart';
import 'package:flutter_admin/networking/api_response.dart';
import 'package:flutter_admin/services/interfaces/companies_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'companies_event.dart';
part 'companies_state.dart';

class CompaniesBloc extends BaseBloc<CompaniesEvent, CompaniesState> {
  final CompaniesRepository companiesRepository;

  CompaniesBloc(this.companiesRepository) : super(CompaniesInitial()) {
    on<RequestForCompaniesData>(_fetchCompaniesData);
    on<RequestForNewCompanyCreation>(_createNewCompany);
    on<RequestForCompanyUpdation>(_updateCompany);
    on<RequestForCompanyDeletion>(_deleteCompany);
    on<SearchCompany>(_filterCompany);
  }

  void _fetchCompaniesData(
    RequestForCompaniesData event,
    Emitter<CompaniesState> emit,
  ) async {
    emit(CompainesLoading());
    final ApiResponse resp = await companiesRepository.getCompaniesData(
      paginate: event.paginate,
      page: event.page,
      pageLength: event.pageLength,
      search: event.search,
    );
    if (resp.data != null && resp.data is Companies) {
      emit(CompaniesDataFetched(companies: resp.data));
    } else {
      emit(CompanyDataFetchingFailed());
    }
  }

  void _createNewCompany(
      RequestForNewCompanyCreation event, Emitter<CompaniesState> emit) async {
    final ApiResponse resp = await companiesRepository.createNewCompany(
      logo: event.logo,
      companyName: event.name,
      website: event.website,
      location: event.location,
      currency: event.currency,
      phone: event.phone,
      tax: event.tax,
      taxId: event.taxId,
    );
    if (resp.data != null) {
      emit(NewCompanyCreated());
    } else {
      emit(CompanyCreationFailed());
    }
  }

  void _updateCompany(event, emit) {}
  void _deleteCompany(event, emit) {}
  void _filterCompany(event, emit) {}
}
