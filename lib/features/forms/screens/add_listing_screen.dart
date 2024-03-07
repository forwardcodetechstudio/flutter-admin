import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/constants/app_button_styles.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/core/widgets/app_breadcrumb.dart';
import 'package:flutter_admin/core/widgets/app_footer.dart';
import 'package:flutter_admin/core/widgets/custom_text_field.dart';
import 'package:flutter_admin/core/widgets/custom_dropdown.dart';
import 'package:flutter_admin/features/tables/bloc/listing/listing_bloc.dart';
import 'package:flutter_admin/features/tables/models/listing.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddListingScreen extends StatefulWidget {
  const AddListingScreen({super.key});

  @override
  State<AddListingScreen> createState() => _AddListingScreenState();
}

class _AddListingScreenState extends State<AddListingScreen> {
  final TextEditingController nameTextEditingController =
      TextEditingController();
  late String user;
  late String cateyory;
  final TextEditingController descriptionTextEditingController =
      TextEditingController();
  final TextEditingController websiteTextEditingController =
      TextEditingController();
  final TextEditingController phoneTextEditingController =
      TextEditingController();
  final TextEditingController locationTextEditingController =
      TextEditingController();
  final TextEditingController latitudeTextEditingController =
      TextEditingController();
  final TextEditingController longitudeTextEditingController =
      TextEditingController();
  final TextEditingController googleIdTextEditingController =
      TextEditingController();
  late String area;
  late String services;
  late String tags;
  late String amenities;
  late String type;
  late String status;

  @override
  Widget build(BuildContext context) {
    const ResponsiveDesignGridColumns formLayout = ResponsiveDesignGridColumns(
      small: 12,
      medium: 6,
      large: 4,
    );

    return ListView(
      children: [
        BlocBuilder<ListingBloc, ListingState>(
          builder: (context, state) {
            return (state is ListingAdding)
                ? const LinearProgressIndicator()
                : const SizedBox();
          },
        ),
        const Padding(
          padding: EdgeInsets.all(24),
          child: AppBreadCrumbs(locationName: RoutesName.addListing),
        ),
        Container(
          color: AppColors.white,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.all(24),
          child: ResponsiveDesignGrid(
            children: [
              ResponsiveDesignGridRow(
                children: [
                  ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: CustomTextField(
                      label: 'Name',
                      textEditingController: nameTextEditingController,
                      hintText: 'Enter Listing Name',
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: SelectBox(
                      label: 'User',
                      onChanged: (value) {
                        user = value!;
                      },
                      options: const [
                        'User1',
                        'User2',
                      ],
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: SelectBox(
                      label: 'Category',
                      onChanged: (value) {
                        cateyory = value!;
                      },
                      options: const [
                        'Category1',
                        'Category2',
                      ],
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: CustomTextField(
                      label: 'Description',
                      textEditingController: descriptionTextEditingController,
                      hintText: 'Enter Listing Description',
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: CustomTextField(
                      label: 'Website',
                      hintText: 'Enter Listing Website',
                      textEditingController: websiteTextEditingController,
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: CustomTextField(
                      label: 'Phone',
                      hintText: 'Enter Listing Phone Number',
                      textEditingController: phoneTextEditingController,
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: CustomTextField(
                      label: 'Location',
                      hintText: 'Enter Listing Location',
                      textEditingController: locationTextEditingController,
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: CustomTextField(
                      label: 'Latitude',
                      hintText: 'Enter Listing Latitude',
                      textEditingController: latitudeTextEditingController,
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: CustomTextField(
                      label: 'Longitude',
                      hintText: 'Enter Listing Longitude',
                      textEditingController: longitudeTextEditingController,
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: SelectBox(
                      label: 'Area',
                      onChanged: (value) {
                        area = value!;
                      },
                      options: const [
                        'Area1',
                        'Area2',
                      ],
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: SelectBox(
                      label: 'Services',
                      onChanged: (value) {
                        services = value!;
                      },
                      options: const [
                        'Services1',
                        'Services2',
                      ],
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: SelectBox(
                      label: 'Tags',
                      onChanged: (value) {
                        tags = value!;
                      },
                      options: const [
                        'Tag1',
                        'Tag2',
                      ],
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: SelectBox(
                      label: 'Amenities',
                      onChanged: (value) {
                        amenities = value!;
                      },
                      options: const [
                        'Amenities1',
                        'Amenities2',
                      ],
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: SelectBox(
                      label: 'Type',
                      onChanged: (value) {
                        type = value!;
                      },
                      options: const [
                        'Type1',
                        'Type2',
                      ],
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: SelectBox(
                      label: 'Status',
                      onChanged: (value) {
                        status = value!;
                      },
                      options: const [
                        'Active',
                        'deactive',
                      ],
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: CustomTextField(
                      label: 'Google Id',
                      hintText: 'Enter Listing Google Id',
                      textEditingController: googleIdTextEditingController,
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: const ResponsiveDesignGridColumns(small: 12),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        onPressed: () {
                          final newListing = Listing(
                            id: '----',
                            name: nameTextEditingController.text,
                            user: user,
                            category: cateyory,
                            description: descriptionTextEditingController.text,
                            website: websiteTextEditingController.text,
                            phone: phoneTextEditingController.text,
                            location: locationTextEditingController.text,
                            latitude: latitudeTextEditingController.text,
                            longitude: longitudeTextEditingController.text,
                            area: area,
                            services: services,
                            tags: tags,
                            amenities: amenities,
                            type: type,
                            status: status,
                            googleId: googleIdTextEditingController.text,
                          );
                      
                          context
                              .read<ListingBloc>()
                              .add(AddListing(listing: newListing));
                        },
                        style: AppButtonStyles.primary,
                        child: const Text('Submit'),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        24.sbh,
        const AppFooter(),
      ],
    );
  }
}
