import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/core/widgets/app_breadcrumb.dart';
import 'package:flutter_admin/core/widgets/custom_icon_button.dart';
import 'package:flutter_admin/core/widgets/custom_table.dart';
import 'package:flutter_admin/features/company/bloc/companies_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyListingScreen extends StatelessWidget {
  const CompanyListingScreen({super.key});

  static const List<String> companyListingColumnName = [
    'Name',
    'Created At',
    'Last Updated At',
    'Status',
    'Action',
  ];

  @override
  Widget build(BuildContext context) {
    // color
    // final background = Theme.of(context).colorScheme.background;
    final onBackground = Theme.of(context).colorScheme.onBackground;

    return BlocConsumer<CompaniesBloc, CompaniesState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CompaniesInitial) {
          context.read<CompaniesBloc>().add(
                const RequestForCompaniesData(paginate: true, page: 1),
              );
        }

        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const AppBreadCrumbs(locationName: RoutesName.companyListing),
              24.sbh,
              Builder(
                builder: (context) {
                  if (state is CompaniesDataFetched) {
                    final int currentPage = state.companies.currentPage ?? 1;
                    final int totalPage = state.companies.total!;
                    return Expanded(
                      child: CustomTable(
                        rowsPerPage: 10,
                        isLoading: state is CompainesLoading,
                        totalPage: totalPage,
                        currentPage: currentPage,
                        columns: companyListingColumnName.map((e) {
                          return Text(
                            e,
                            style: TextStyle(color: onBackground),
                          );
                        }).toList(),
                        rows: state.companies.data!.map((company) {
                          final TextStyle textStyle =
                              TextStyle(color: onBackground);
                          return [
                            Text(
                              company.name ?? '',
                              style: textStyle,
                            ),
                            Text(
                              company.createdAt ?? '',
                              style: textStyle,
                            ),
                            Text(
                              company.updatedAt ?? '',
                              style: textStyle,
                            ),
                            Text(
                              company.status ?? '',
                              style: textStyle,
                            ),
                            const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomIconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: AppColors.blue0080ff,
                                  ),
                                ),
                                CustomIconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: AppColors.red,
                                  ),
                                ),
                              ],
                            )
                          ];
                        }).toList(),
                        listViewLayoutBuilder: (companyData) {
                          return ListTile(
                            title: companyData[0],
                            subtitle: Column(
                              children: [
                                companyData[1],
                                companyData[2],
                              ],
                            ),
                            trailing: companyData[4],
                          );
                        },
                      ),
                    );
                  }

                  return 0.sbh;
                },
              )
            ],
          ),
        );
      },
    );
  }
}
