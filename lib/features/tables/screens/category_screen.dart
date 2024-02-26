import 'package:flutter/material.dart';
import 'package:flutter_admin/features/tables/bloc/category/category_bloc.dart';
import 'package:flutter_admin/features/tables/models/category.dart';
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
    'Created At'
        'Last Updated At'
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
                    if (state is CategoryInitial) {
                      context.read<CategoryBloc>().add(GetCategory());
                    } else if (state is CategoryFetching) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is CategoryFetchingSucceeded) {
                      
                    }
                      return const SizedBox();
                    // Category categories = state.categories!;
                    // return DataTable(
                    //   headingRowColor:
                    //       const MaterialStatePropertyAll(AppColors.white),
                    //   dataRowColor:
                    //       const MaterialStatePropertyAll(AppColors.white),
                    //   columns: _columnsName
                    //       .map((columnName) =>
                    //           DataColumn(label: Text(columnName)))
                    //       .toList(),
                    //   rows: categories.data.data.map((categoryData) {
                    //     return DataRow(
                    //       cells: [
                    //         DataCell(Text(categoryData.id)),
                    //         DataCell(Text(categoryData.name)),
                    //         DataCell(Text(categoryData.createdAt)),
                    //         DataCell(Text(categoryData.updatedAt)),
                    //       ],
                    //     );
                    //   }).toList(),
                    // );
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
