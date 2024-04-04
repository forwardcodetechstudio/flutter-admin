import 'package:flutter/material.dart';
import 'package:flutter_admin/base/stateless_page.dart';
import 'package:flutter_admin/core/shared/bloc/category/category_bloc.dart';
import 'package:flutter_admin/core/shared/models/category.dart';
import 'package:flutter_admin/core/utils/show_feedback_alert.dart';
import 'package:flutter_admin/core/widgets/custom_table.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/core/widgets/app_breadcrumb.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_debounce/easy_debounce.dart';

class CategoryScreen extends StatelessPage<CategoryBloc> {
  CategoryScreen({super.key});

  static const List<String> _categoryTableColumns = [
    'Name',
    'Created At',
    'Last Updated At',
    'Actions',
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
              bloc: bloc,
              listener: (context, state) {
                if (state is CategoryRemoved) {
                  showSnackBar(
                    context,
                    'Category Deleted Successfully!',
                  );
                }
              },
              builder: (context, state) {
                if (state is CategoryInitial ||
                    state is CategoryCreationFailed ||
                    state is CategoryCreated ||
                    state is CategoryRemoved ||
                    state is CategoryUpdated ||
                    state is CategoryUpdationFailed ||
                    state is CategoryRemovingFalied) {
                  bloc.add(const GetCategory(page: 1));
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
                    columns: _categoryTableColumns
                        .map((e) => Text(
                              e,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                            ))
                        .toList(),
                    rows: categoryQuerySet.map((categoryData) {
                      final TextStyle textStyle = TextStyle(
                          color: Theme.of(context).colorScheme.onBackground);
                      return [
                        Text(
                          categoryData.name,
                          style: textStyle,
                        ),
                        Text(
                          categoryData.createdAt,
                          style: textStyle,
                        ),
                        Text(
                          categoryData.updatedAt ?? '--',
                          style: textStyle,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              // A delete button widget to delete categeory instance
                              onTap: () {
                                showFeedBackAlert(
                                        context: context,
                                        text: 'Are you sure you want to delete',
                                        title: 'Danger')
                                    .then((wantToDelete) => {
                                          if (wantToDelete)
                                            {
                                              bloc.add(
                                                RequestCategoryDeleation(
                                                  categoryId: categoryData.id,
                                                ),
                                              )
                                            }
                                        });
                              },
                              child: const Icon(
                                Icons.delete,
                                color: AppColors.red,
                              ),
                            ),
                            6.sbw,
                            // Edit button to update category instance
                            InkWell(
                              onTap: () {
                                context.goNamed(RoutesName.updateCategory,
                                    queryParameters: {
                                      'id': categoryData.id,
                                      'name': categoryData.name,
                                    });
                              },
                              child: const Icon(
                                Icons.edit,
                                color: AppColors.blue0080ff,
                              ),
                            ),
                          ],
                        ),
                      ];
                    }).toList(),
                    totalPage: totalPage,
                    currentPage: currentPage,
                    rowsPerPage: rowsPerPage,
                    searchTextEditingController: searchTextEditingController,
                    onSearchTextChanged: (value) {
                      EasyDebounce.debounce(
                        'searchCategory',
                        const Duration(milliseconds: 500),
                        () {
                          bloc.add(SearchCategory(
                            text: searchTextEditingController.text,
                          ));
                        },
                      );
                    },
                    onPrevPageButtonClicked: () {
                      bloc.add(
                        GetCategory(page: currentPage - 1),
                      );
                    },
                    onNextPageButtonClicked: () {
                      bloc.add(
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
