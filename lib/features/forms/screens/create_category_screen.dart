import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/constants/app_button_styles.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/core/shared/bloc/category/category_bloc.dart';
import 'package:flutter_admin/core/utils/show_snackbar.dart';
import 'package:flutter_admin/core/widgets/app_breadcrumb.dart';
import 'package:flutter_admin/core/widgets/input_box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CreateCategoryScreen extends StatelessWidget {
  final String? categeoryId;
  final String? categeoryName;

  const CreateCategoryScreen({
    super.key,
    this.categeoryId,
    this.categeoryName,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController createCategoryTextEditingController =
        TextEditingController(text: categeoryName);
    return BlocConsumer<CategoryBloc, CategoryState>(
      listener: (context, state) {
        if (state is CategoryCreated) {
          createCategoryTextEditingController.clear();
          showSnackbar(context: context, text: 'Category Created Successfully');
        } else if (state is CategoryUpdated) {
          createCategoryTextEditingController.clear();
          showSnackbar(context: context, text: 'Category Updated Successfully');
          context.goNamed(RoutesName.category);
        } else if (state is CategoryCreationFailed) {
          showSnackbar(
            context: context,
            text: 'Category Not Created',
            backgroundColor: AppColors.danger,
          );
        } else if (state is CategoryUpdationFailed) {
          showSnackbar(
            context: context,
            text: 'Category Not Updated',
            backgroundColor: AppColors.danger,
          );
        }
      },
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const AppBreadCrumbs(locationName: RoutesName.createCategory),
            24.sbh,
            18.sbh,
            ResponsiveDesignGrid(
              useOuterPadding: false,
              children: [
                ResponsiveDesignGridRow(
                  children: [
                    ResponsiveDesignGridItem(
                      columns: const ResponsiveDesignGridColumns(
                        small: 12,
                        medium: 2,
                        large: 3,
                      ),
                      child: InputBox(
                        label: 'Category Name',
                        placeholder: 'Name',
                        textEditingController:
                            createCategoryTextEditingController,
                      ),
                    ),
                    ResponsiveDesignGridItem(
                      columns: const ResponsiveDesignGridColumns(
                        small: 12,
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: (categeoryId == null)
                            ? // create new category
                            ElevatedButton(
                                onPressed: () {
                                  context.read<CategoryBloc>().add(
                                        RequestCategoryCreation(
                                          categoryName:
                                              createCategoryTextEditingController
                                                  .text,
                                        ),
                                      );
                                },
                                style: AppButtonStyles.primary,
                                child: const Text('Create'),
                              )
                            : // update category of given id
                            ElevatedButton(
                                onPressed: () {
                                  context.read<CategoryBloc>().add(
                                        RequestCategoryUpdation(
                                          categoryId: categeoryId!,
                                          categoryName:
                                              createCategoryTextEditingController
                                                  .text,
                                        ),
                                      );
                                },
                                style: AppButtonStyles.primary,
                                child: const Text('Save Changes'),
                              ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
