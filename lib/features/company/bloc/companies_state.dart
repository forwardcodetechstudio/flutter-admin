part of 'companies_bloc.dart';

sealed class CompaniesState extends Equatable {
  const CompaniesState();

  @override
  List<Object> get props => [];
}

final class CompaniesInitial extends CompaniesState {}

final class CompainesLoading extends CompaniesState {}

final class CompaniesDataFetched extends CompaniesState {
  final Companies companies;

  const CompaniesDataFetched({required this.companies});
}

final class NewCompanyCreated extends CompaniesState {}

final class CompanyUpdated extends CompaniesState {}

final class CompanyDeleted extends CompaniesState {}

final class CompanyDataFetchingFailed extends CompaniesState {}

final class CompanyCreationFailed extends CompaniesState {}

final class CompanyUpdationFailed extends CompaniesState {}

final class CompanyDeletionFailed extends CompaniesState {}
