import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/core/shared/bloc/category/category_bloc.dart';
import 'package:flutter_admin/core/utils/show_snackbar.dart';
import 'package:flutter_admin/core/widgets/app_breadcrumb.dart';
import 'package:flutter_admin/core/widgets/custom_elevated_button.dart';
import 'package:flutter_admin/core/widgets/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CreateUpdateCategoryScreen extends StatelessWidget {
  final String? categoryId;
  final String? categeoryName;

  const CreateUpdateCategoryScreen({
    super.key,
    this.categoryId,
    this.categeoryName,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController createCategoryTextEditingController =
        TextEditingController(text: categeoryName);

    // color
    final Color background = Theme.of(context).colorScheme.background;
    // final Color onBackground = Theme.of(context).colorScheme.onBackground;

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
            backgroundColor: AppColors.red,
          );
        } else if (state is CategoryUpdationFailed) {
          showSnackbar(
            context: context,
            text: 'Category Not Updated',
            backgroundColor: AppColors.red,
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
            AppBreadCrumbs(
              locationName: (categoryId == null)
                  ? RoutesName.createCategory
                  : RoutesName.updateCategory,
            ),
            24.sbh,
            Container(
              color: background,
              padding: const EdgeInsets.all(24),
              child: ResponsiveDesignGrid(
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
                        child: CustomTextField(
                          label: 'Category Name',
                          hintText: 'Name',
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
                          child: (categoryId == null)
                              ? // create new category
                              CustomElevatedButton(
                                  onPressed: () {
                                    context.read<CategoryBloc>().add(
                                          RequestCategoryCreation(
                                            categoryName:
                                                createCategoryTextEditingController
                                                    .text,
                                          ),
                                        );
                                  },
                                  text: 'Create',
                                )
                              : // update category of given id
                              CustomElevatedButton(
                                  onPressed: () {
                                    context.read<CategoryBloc>().add(
                                          RequestCategoryUpdation(
                                            categoryId: categoryId!,
                                            categoryName:
                                                createCategoryTextEditingController
                                                    .text,
                                          ),
                                        );
                                  },
                                  text: 'Save Changes',
                                ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
