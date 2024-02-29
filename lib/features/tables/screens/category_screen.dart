import 'package:flutter/material.dart';
import 'package:flutter_admin/core/shared/bloc/category/category_bloc.dart';
import 'package:flutter_admin/core/shared/models/category.dart';
import 'package:flutter_admin/core/utils/show_feedback_alert.dart';
import 'package:flutter_admin/core/utils/show_snackbar.dart';
import 'package:flutter_admin/core/widgets/custom_table.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/core/widgets/app_breadcrumb.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  static const List<Widget> _categoryTableColumns = [
    Text('Name'),
    Text('Created At'),
    Text('Last Updated At'),
    Text('Actions'),
  ];

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchTextEditingController =
        TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const AppBreadCrumbs(locationName: RoutesName.category),
          24.sbh,
          Expanded(
            child: BlocConsumer<CategoryBloc, CategoryState>(
              listener: (context, state) {
                if (state is CategoryRemoved) {
                  showSnackbar(
                    context: context,
                    text: 'Category Deleted Successfully!',
                  );
                }
              },
              builder: (context, state) {
                if (state is CategoryInitial ||
                    state is CategoryCreationFailed ||
                    state is CategoryCreated ||
                    state is CategoryRemoved ||
                    state is CategoryRemovingFalied) {
                  context.read<CategoryBloc>().add(const GetCategory(page: 1));
                }
                if (state is CategoryLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CategoryFetchingSucceeded) {
                  Category category = state.categories!;
                  final List<Datum> categoryQuerySet = category.data.data;
                  int currentPage = category.data.currentPage;
                  final int rowsPerPage = category.data.perPage;
                  int totalPage =
                      (category.data.total ~/ category.data.perPage);
                  if (category.data.total % category.data.perPage != 0) {
                    totalPage++;
                  }
                  return CustomTable(
                    columns: _categoryTableColumns,
                    rows: categoryQuerySet.map((categoryData) {
                      return [
                        Text(categoryData.name),
                        Text(categoryData.createdAt),
                        Text(categoryData.updatedAt ?? '--'),
                        // A delete button widget to delete categeory instance
                        InkWell(
                          onTap: () {
                            showFeedBackAlert(
                                    context: context,
                                    text: 'Are you sure you want to delete',
                                    title: 'Danger')
                                .then((wantToDelete) => {
                                      if (wantToDelete)
                                        {
                                          context.read<CategoryBloc>().add(
                                                RequestCategoryDeleation(
                                                  categoryId: categoryData.id,
                                                ),
                                              )
                                        }
                                    });
                          },
                          child: const Icon(
                            Icons.delete,
                            color: AppColors.danger,
                          ),
                        ),
                      ];
                    }).toList(),
                    totalPage: totalPage,
                    currentPage: currentPage,
                    rowsPerPage: rowsPerPage,
                    searchTextEditingController: searchTextEditingController,
                    onSearchButtonTap: () {
                      context.read<CategoryBloc>().add(
                            SearchCategory(
                              text: searchTextEditingController.text,
                            ),
                          );
                    },
                    onPrevPageButtonClicked: () {
                      context.read<CategoryBloc>().add(
                            GetCategory(page: currentPage - 1),
                          );
                    },
                    onNextPageButtonClicked: () {
                      context.read<CategoryBloc>().add(
                            GetCategory(page: currentPage + 1),
                          );
                    },
                    listViewLayoutBuilder: (List<Widget> row) {
                      return ListTile(
                        title: row[0],
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            row[1],
                            row[2],
                          ],
                        ),
                        trailing: row[3],
                      );
                    },
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
        ],
      ),
    );
  }
}
