import 'package:flutter/material.dart';
import 'package:flutter_admin/core/shared/bloc/category/category_bloc.dart';
import 'package:flutter_admin/core/shared/models/category.dart';
import 'package:flutter_admin/core/widgets/input_box.dart';
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
    final TextEditingController searchTextEditingController =
        TextEditingController();
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
                      context
                          .read<CategoryBloc>()
                          .add(const GetCategory(page: 1));
                    }
                    if (state is CategoryLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is CategoryFetchingSucceeded) {
                      Category category = state.categories!;
                      int currentPage = category.data.currentPage;
                      int totalPage =
                          (category.data.total ~/ category.data.perPage) + 1;
                      return Column(
                        children: [
                          SizedBox(
                            width: 350,
                            child: InputBox(
                              placeholder: 'Search',
                              suffixIcon: InkWell(
                                child: const Icon(Icons.search),
                                onTap: () {
                                  context.read<CategoryBloc>().add(
                                      SearchCategory(
                                          text: searchTextEditingController
                                              .text));
                                },
                              ),
                              textEditingController:
                                  searchTextEditingController,
                            ),
                          ),
                          DataTable(
                            headingRowColor:
                                const MaterialStatePropertyAll(AppColors.white),
                            dataRowColor:
                                const MaterialStatePropertyAll(AppColors.white),
                            columns: _columnsName
                                .map((columnName) =>
                                    DataColumn(label: Text(columnName)))
                                .toList(),
                            rows: category.data.data.map((categoryData) {
                              return DataRow(
                                cells: [
                                  DataCell(Text(category.data.data
                                      .indexOf(categoryData)
                                      .toString())),
                                  DataCell(Text(categoryData.name)),
                                  DataCell(Text(categoryData.createdAt)),
                                  DataCell(
                                      Text(categoryData.updatedAt ?? '--')),
                                ],
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                Text('1 - $totalPage of $currentPage'),
                                12.sbw,
                                IconButton(
                                  onPressed: (currentPage > 1)
                                      ? () {
                                          context.read<CategoryBloc>().add(
                                              GetCategory(
                                                  page: currentPage - 1));
                                        }
                                      : null,
                                  icon: const Icon(Icons.arrow_back_ios_new),
                                  iconSize: 18,
                                ),
                                8.sbw,
                                IconButton(
                                  onPressed: (currentPage < totalPage)
                                      ? () {
                                          context.read<CategoryBloc>().add(
                                              GetCategory(
                                                  page: currentPage + 1));
                                        }
                                      : null,
                                  icon: const Icon(Icons.arrow_forward_ios),
                                  iconSize: 18,
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    }
                    return Center(
                      child: ElevatedButton(
                        onPressed: () {
                          searchTextEditingController.clear();
                          context
                              .read<CategoryBloc>()
                              .add(const GetCategory(page: 1));
                        },
                        child: const Text('Refresh'),
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
