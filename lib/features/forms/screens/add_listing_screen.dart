import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/constants/app_button_styles.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/core/widgets/app_breadcrumb.dart';
import 'package:flutter_admin/core/widgets/input_box.dart';
import 'package:flutter_admin/core/widgets/select_box.dart';

class AddListingScreen extends StatelessWidget {
  const AddListingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    const ResponsiveDesignGridColumns formLayout = ResponsiveDesignGridColumns(
      small: 12,
      medium: 6,
      large: 4,
    );
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const AppBreadCrumbs(locationName: RoutesName.addListing),
        24.sbh,
        Container(
          color: AppColors.white,
          padding: const EdgeInsets.all(24),
          child: ResponsiveDesignGrid(
            children: [
              ResponsiveDesignGridRow(
                children: [
                  const ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: InputBox(
                      label: 'Name',
                      placeholder: 'Enter Listing Name',
                    ),
                  ),
                  const ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: SelectBox(
                      label: 'User',
                      options: [
                        DropdownMenuItem(
                          value: 1,
                          child: Text('User1'),
                        )
                      ],
                    ),
                  ),
                  const ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: SelectBox(
                      label: 'Category',
                      options: [
                        DropdownMenuItem(
                          value: 1,
                          child: Text('Cateyory1'),
                        )
                      ],
                    ),
                  ),
                  const ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: InputBox(
                      label: 'Description',
                      placeholder: 'Enter Listing Description',
                    ),
                  ),
                  const ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: InputBox(
                      label: 'Website',
                      placeholder: 'Enter Listing Website',
                    ),
                  ),
                  const ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: InputBox(
                      label: 'Phone',
                      placeholder: 'Enter Listing Phone Number',
                    ),
                  ),
                  const ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: InputBox(
                      label: 'Location',
                      placeholder: 'Enter Listing Location',
                    ),
                  ),
                  const ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: InputBox(
                      label: 'Latitude',
                      placeholder: 'Enter Listing Latitude',
                    ),
                  ),
                  const ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: InputBox(
                      label: 'Longitude',
                      placeholder: 'Enter Listing Longitude',
                    ),
                  ),
                  const ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: SelectBox(
                      label: 'Area',
                      options: [
                        DropdownMenuItem(
                          value: 1,
                          child: Text('Area1'),
                        ),
                      ],
                    ),
                  ),
                  const ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: SelectBox(
                      label: 'Services',
                      options: [
                        DropdownMenuItem(
                          value: 1,
                          child: Text('Services1'),
                        ),
                      ],
                    ),
                  ),
                  const ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: SelectBox(
                      label: 'Tags',
                      options: [
                        DropdownMenuItem(
                          value: 1,
                          child: Text('Tags1'),
                        ),
                      ],
                    ),
                  ),
                  const ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: SelectBox(
                      label: 'Amenities',
                      options: [
                        DropdownMenuItem(
                          value: 1,
                          child: Text('Amenities1'),
                        ),
                      ],
                    ),
                  ),
                  const ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: SelectBox(
                      label: 'Type',
                      options: [
                        DropdownMenuItem(
                          value: 1,
                          child: Text('Type1'),
                        ),
                      ],
                    ),
                  ),
                  const ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: SelectBox(
                      label: 'Status',
                      options: [
                        DropdownMenuItem(
                          value: 1,
                          child: Text('Active'),
                        ),
                      ],
                    ),
                  ),
                  const ResponsiveDesignGridItem(
                    columns: formLayout,
                    child: InputBox(
                      label: 'Google Id',
                      placeholder: 'Enter Listing Google Id',
                    ),
                  ),
                  ResponsiveDesignGridItem(
                  columns: const ResponsiveDesignGridColumns(small: 12),
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: AppButtonStyles.primary,
                      child: const Text('Submit'),
                    ),
                  ),
                )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
