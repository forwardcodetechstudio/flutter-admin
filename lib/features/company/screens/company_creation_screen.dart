import 'package:design_grid/design_grid.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/config/theme/bloc/theme_bloc.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/core/utils/show_snackbar.dart';
import 'package:flutter_admin/core/widgets/app_breadcrumb.dart';
import 'package:flutter_admin/core/widgets/custom_elevated_button.dart';
import 'package:flutter_admin/core/widgets/custom_text_field.dart';
import 'package:flutter_admin/core/widgets/custom_dropdown.dart';
import 'package:flutter_admin/features/company/bloc/companies_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dotted_border/dotted_border.dart';

class CompanyCreationScreen extends StatefulWidget {
  const CompanyCreationScreen({super.key});

  @override
  State<CompanyCreationScreen> createState() => _CompanyCreationScreenState();
}

class _CompanyCreationScreenState extends State<CompanyCreationScreen> {
  Uint8List? _selectedImage;
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
        } else if(state is CompanyCreationFailed) {
          showSnackbar(
            context: context,
            text: 'Company Not Created!',
            backgroundColor: Theme.of(context).colorScheme.error,
          );
        }
      },
      builder: (context, state) {
        final isFormLoading = state is CompainesLoading;

        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            final bool isLightThemeActive =
                (state as DefaultTheme).isLightThemeActive;

            return ListView(
              padding: const EdgeInsets.all(24),
              children: [
                const AppBreadCrumbs(locationName: RoutesName.createNewCompany),
                24.sbh,
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: isLightThemeActive ? AppColors.white : null,
                    border: Border.all(color: AppColors.white),
                  ),
                  child: ResponsiveDesignGrid(
                    children: [
                      ResponsiveDesignGridRow(
                        children: [
                          ResponsiveDesignGridItem(
                            columns:
                                const ResponsiveDesignGridColumns(small: 12),
                            child: InkWell(
                              onTap: () async {
                                final FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.image,
                                  allowMultiple: false,
                                );
                                if (result != null) {
                                  setState(() {
                                    _selectedImage = result.files.first.bytes;
                                  });
                                }
                              },
                              child: DottedBorder(
                                color: AppColors.blueGrey8A98AC,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Container(
                                    padding: const EdgeInsets.all(24),
                                    child: Column(
                                      children: [
                                        isImageSelected
                                            ? Image.memory(
                                                _selectedImage!,
                                                width: 100,
                                                height: 100,
                                              )
                                            : const Icon(
                                                Icons.image,
                                                size: 50,
                                                color: AppColors.blueGrey8A98AC,
                                              ),
                                        12.sbh,
                                        Text(
                                          isImageSelected
                                              ? 'Change Logo'
                                              : 'Upload Logo',
                                          style: const TextStyle(
                                            color: AppColors.blueGrey8A98AC,
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
                            child: CustomTextField(
                              hintText: 'your name',
                              label: 'Name*',
                              textEditingController: nameTextEditingController,
                            ),
                          ),
                          ResponsiveDesignGridItem(
                            columns: columns,
                            child: CustomTextField(
                              hintText: 'https://',
                              label: 'website',
                              textEditingController:
                                  websiteTextEditingController,
                            ),
                          ),
                          ResponsiveDesignGridItem(
                            columns: columns,
                            child: SelectBox<String>(
                              label: 'Company Location',
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
                              label: 'Currency*',
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
                            child: CustomTextField(
                              hintText: '00000 00000',
                              label: 'Phone*',
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textEditingController: phoneTextEditingController,
                            ),
                          ),
                          ResponsiveDesignGridItem(
                            columns: columns,
                            child: CustomTextField(
                              hintText: '10.0',
                              label: 'Tax*',
                              suffixIcon: const Icon(
                                Icons.percent,
                                color: AppColors.blueGrey8A98AC,
                                size: 16,
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp("^[0-9]*[\.]?[0-9]*"),
                                ),
                              ],
                              textEditingController: taxTextEditingController,
                            ),
                          ),
                          ResponsiveDesignGridItem(
                            columns: columns,
                            child: CustomTextField(
                              label: 'Tax ID*',
                              hintText: 'AF4D4VF',
                              textEditingController: taxIdTextEditingController,
                            ),
                          ),
                        ],
                      ),
                      ResponsiveDesignGridRow(children: [
                        ResponsiveDesignGridItem(
                          columns: const ResponsiveDesignGridColumns(small: 12),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 16),
                              height: 45,
                              child: CustomElevatedButton(
                                  onPressed: () {
                                    // decimal, greater than 0, max 99.99
                                    double tax = double.tryParse(
                                            taxIdTextEditingController.text) ??
                                        0;
                                    if (_selectedImage != null &&
                                        nameTextEditingController
                                            .text.isNotEmpty &&
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
                                        website:
                                            websiteTextEditingController.text,
                                        location: location,
                                        currency: currency,
                                        phone: phoneTextEditingController.text,
                                        tax: tax,
                                        taxId: taxIdTextEditingController.text,
                                      );
                                      context
                                          .read<CompaniesBloc>()
                                          .add(requestForNewCompanyCreation);
                                    }
                                  },
                                  isLoading: isFormLoading,
                                  text: 'Create Company'),
                            ),
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
      },
    );
  }
}
