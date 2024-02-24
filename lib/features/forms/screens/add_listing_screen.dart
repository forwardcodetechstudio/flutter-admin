import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/constants/app_button_styles.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/core/widgets/app_breadcrumb.dart';
import 'package:flutter_admin/core/widgets/app_footer.dart';
import 'package:flutter_admin/core/widgets/input_box.dart';
import 'package:flutter_admin/core/widgets/select_box.dart';
import 'package:flutter_admin/features/tables/bloc/listing_bloc.dart';
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
          child: ResponsiveDesignGrid(
            children: [
              ResponsiveDesignGridRow(
                children: [
                  ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: InputBox(
                      label: 'Name',
                      textEditingController: nameTextEditingController,
                      placeholder: 'Enter Listing Name',
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
                        DropdownMenuItem(
                          value: 'user1',
                          child: Text('User1'),
                        ),
                        DropdownMenuItem(
                          value: 'user2',
                          child: Text('User2'),
                        ),
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
                        DropdownMenuItem(
                          value: 'cateyory1',
                          child: Text('Cateyory1'),
                        ),
                        DropdownMenuItem(
                          value: 'cateyory2',
                          child: Text('Cateyory2'),
                        )
                      ],
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: InputBox(
                      label: 'Description',
                      textEditingController: descriptionTextEditingController,
                      placeholder: 'Enter Listing Description',
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: InputBox(
                      label: 'Website',
                      placeholder: 'Enter Listing Website',
                      textEditingController: websiteTextEditingController,
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: InputBox(
                      label: 'Phone',
                      placeholder: 'Enter Listing Phone Number',
                      textEditingController: phoneTextEditingController,
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: InputBox(
                      label: 'Location',
                      placeholder: 'Enter Listing Location',
                      textEditingController: locationTextEditingController,
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: InputBox(
                      label: 'Latitude',
                      placeholder: 'Enter Listing Latitude',
                      textEditingController: latitudeTextEditingController,
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: InputBox(
                      label: 'Longitude',
                      placeholder: 'Enter Listing Longitude',
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
                        DropdownMenuItem(
                          value: 'area1',
                          child: Text('Area1'),
                        ),
                        DropdownMenuItem(
                          value: 'area2',
                          child: Text('Area2'),
                        ),
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
                        DropdownMenuItem(
                          value: 'services1',
                          child: Text('Services1'),
                        ),
                        DropdownMenuItem(
                          value: 'services2',
                          child: Text('Services2'),
                        ),
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
                        DropdownMenuItem(
                          value: 'tag1',
                          child: Text('Tag1'),
                        ),
                        DropdownMenuItem(
                          value: 'tag2',
                          child: Text('Tag2'),
                        ),
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
                        DropdownMenuItem(
                          value: 'amenities1',
                          child: Text('Amenities1'),
                        ),
                        DropdownMenuItem(
                          value: 'amenities2',
                          child: Text('Amenities2'),
                        ),
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
                        DropdownMenuItem(
                          value: 'type1',
                          child: Text('Type1'),
                        ),
                        DropdownMenuItem(
                          value: 'type2',
                          child: Text('Type2'),
                        ),
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
                        DropdownMenuItem(
                          value: 'active',
                          child: Text('Active'),
                        ),
                        DropdownMenuItem(
                          value: 'deactive',
                          child: Text('deactive'),
                        ),
                      ],
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: InputBox(
                      label: 'Google Id',
                      placeholder: 'Enter Listing Google Id',
                      textEditingController: googleIdTextEditingController,
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: const ResponsiveDesignGridColumns(small: 12),
                    child: SizedBox(
                      height: 40,
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
