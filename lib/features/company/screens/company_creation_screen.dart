import 'dart:io';

import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/constants/app_button_styles.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/core/utils/show_snackbar.dart';
import 'package:flutter_admin/core/widgets/app_breadcrumb.dart';
import 'package:flutter_admin/core/widgets/input_box.dart';
import 'package:flutter_admin/core/widgets/select_box.dart';
import 'package:flutter_admin/features/company/bloc/companies_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';

class CompanyCreationScreen extends StatefulWidget {
  const CompanyCreationScreen({super.key});

  @override
  State<CompanyCreationScreen> createState() => _CompanyCreationScreenState();
}

class _CompanyCreationScreenState extends State<CompanyCreationScreen> {
  File? _selectedImage;
  final TextEditingController nameTextEditingController =
      TextEditingController();
  final TextEditingController websiteTextEditingController =
      TextEditingController();
  final TextEditingController phoneTextEditingController =
      TextEditingController();
  final TextEditingController taxTextEditingController =
      TextEditingController();
  final TextEditingController taxIdTextEditingController =
      TextEditingController();
  String location = '';
  String currency = '';

  @override
  Widget build(BuildContext context) {
    final bool isImageSelected = _selectedImage != null;
    const ResponsiveDesignGridColumns columns =
        ResponsiveDesignGridColumns(small: 12, medium: 6, large: 4);

    return BlocConsumer<CompaniesBloc, CompaniesState>(
      listener: (context, state) {
        if (state is NewCompanyCreated) {
          showSnackbar(
              context: context, text: 'New Company Create Successfully!');
          setState(() {
            nameTextEditingController.clear();
            phoneTextEditingController.clear();
            websiteTextEditingController.clear();
            taxIdTextEditingController.clear();
            taxTextEditingController.clear();
            location = '';
            currency = '';
            _selectedImage = null;
          });
        } else {
          showSnackbar(
            context: context,
            text: 'Company Not Created!',
            backgroundColor: AppColors.danger,
          );
        }
      },
      builder: (context, state) {
        final isFormLoading = state is CompainesLoading;

        return ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const AppBreadCrumbs(locationName: RoutesName.createNewCompany),
            24.sbh,
            Container(
              color: AppColors.white,
              padding: const EdgeInsets.all(24),
              child: ResponsiveDesignGrid(
                children: [
                  ResponsiveDesignGridRow(
                    children: [
                      ResponsiveDesignGridItem(
                        columns: const ResponsiveDesignGridColumns(small: 12),
                        child: InkWell(
                          onTap: () async {
                            final returnedImage = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);

                            if (returnedImage != null) {
                              setState(() {
                                _selectedImage = File(returnedImage.path);
                              });
                            }
                          },
                          child: DottedBorder(
                            color: AppColors.blueGreyText,
                            child: SizedBox(
                              width: double.infinity,
                              child: Container(
                                color: AppColors.white,
                                padding: const EdgeInsets.all(24),
                                child: Column(
                                  children: [
                                    isImageSelected
                                        ? Image.network(
                                            _selectedImage!.path,
                                            width: 120,
                                            height: 120,
                                          )
                                        : const Icon(
                                            Icons.image,
                                            size: 50,
                                            color: AppColors.blueGreyText,
                                          ),
                                    12.sbh,
                                    Text(
                                      isImageSelected
                                          ? 'Change Logo'
                                          : 'Upload Logo',
                                      style: const TextStyle(
                                        color: AppColors.blueGreyText,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ResponsiveDesignGridItem(
                        columns: columns,
                        child: InputBox(
                          placeholder: 'Name*',
                          textEditingController: nameTextEditingController,
                        ),
                      ),
                      ResponsiveDesignGridItem(
                        columns: columns,
                        child: InputBox(
                          placeholder: 'https://',
                          textEditingController: websiteTextEditingController,
                        ),
                      ),
                      ResponsiveDesignGridItem(
                        columns: columns,
                        child: SelectBox<String>(
                          hint: 'Location*',
                          options: const [
                            'Jamshedpur',
                          ],
                          onChanged: (value) {
                            location = value!;
                          },
                        ),
                      ),
                      ResponsiveDesignGridItem(
                        columns: columns,
                        child: SelectBox<String>(
                          hint: 'Currency*',
                          options: const [
                            'Indian Ruppes (₹)',
                            'The Euro (€)',
                          ],
                          onChanged: (value) {
                            currency = value!;
                          },
                        ),
                      ),
                      ResponsiveDesignGridItem(
                        columns: columns,
                        child: InputBox(
                          placeholder: 'Phone*',
                          textEditingController: phoneTextEditingController,
                        ),
                      ),
                      ResponsiveDesignGridItem(
                        columns: columns,
                        child: InputBox(
                          placeholder: 'Tax*',
                          suffixIcon: const Icon(
                            Icons.percent,
                            color: AppColors.blueGreyText,
                            size: 16,
                          ),
                          textEditingController: taxTextEditingController,
                        ),
                      ),
                      ResponsiveDesignGridItem(
                        columns: columns,
                        child: InputBox(
                          placeholder: 'Tax ID*',
                          textEditingController: taxIdTextEditingController,
                        ),
                      ),
                    ],
                  ),
                  ResponsiveDesignGridRow(children: [
                    ResponsiveDesignGridItem(
                      columns: const ResponsiveDesignGridColumns(small: 12),
                      child: ElevatedButton(
                        onPressed: !isFormLoading
                            ? () {
                                if (_selectedImage != null &&
                                    nameTextEditingController.text.isNotEmpty &&
                                    websiteTextEditingController
                                        .text.isNotEmpty &&
                                    phoneTextEditingController
                                        .text.isNotEmpty &&
                                    taxIdTextEditingController
                                        .text.isNotEmpty &&
                                    taxIdTextEditingController
                                        .text.isNotEmpty) {
                                  final requestForNewCompanyCreation =
                                      RequestForNewCompanyCreation(
                                    logo: _selectedImage!,
                                    name: nameTextEditingController.text,
                                    website: websiteTextEditingController.text,
                                    location: location,
                                    currency: currency,
                                    phone: phoneTextEditingController.text,
                                    tax: taxIdTextEditingController.text,
                                    taxId: taxIdTextEditingController.text,
                                  );
                                  context
                                      .read<CompaniesBloc>()
                                      .add(requestForNewCompanyCreation);
                                }
                              }
                            : null,
                        style: AppButtonStyles.primary,
                        child: !isFormLoading
                            ? const Text('Create Company')
                            : const CircularProgressIndicator(),
                      ),
                    )
                  ]),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
