import 'package:flutter/material.dart';
import 'package:flutter_admin/core/shared/bloc/category/category_bloc.dart';
import 'package:flutter_admin/core/shared/models/category.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/core/widgets/app_breadcrumb.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  static const List<String> _columnsName = [
    '#', // for id or serial no
    'Name',
    'Created At',
    'Last Updated At',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const AppBreadCrumbs(locationName: RoutesName.listing),
          24.sbh,
          Expanded(
            child: SingleChildScrollView(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryInitial ||
                        state is CategoryCreationFailed ||
                        state is CategoryCreated) {
                      context.read<CategoryBloc>().add(GetCategory());
                    }
                    if (state is CategoryLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is CategoryFetchingSucceeded) {
                      Category category = state.categories!;
                      return DataTable(
                        headingRowColor:
                            const MaterialStatePropertyAll(AppColors.white),
                        dataRowColor:
                            const MaterialStatePropertyAll(AppColors.white),
                        columns: _columnsName
                            .map((columnName) =>
                                DataColumn(label: Text(columnName)))
                            .toList(),
                        rows: category.data.map((categoryData) {
                          return DataRow(
                            cells: [
                              DataCell(Text(category.data
                                  .indexOf(categoryData)
                                  .toString())),
                              DataCell(Text(categoryData.name)),
                              DataCell(Text(categoryData.createdAt)),
                              DataCell(Text(categoryData.updatedAt ?? '--')),
                            ],
                          );
                        }).toList(),
                      );
                    }
                    return Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Retry'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
