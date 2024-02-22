import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/core/widgets/app_breadcrumb.dart';
import 'package:flutter_admin/features/tables/data.dart';

class ListingScreen extends StatelessWidget {
  const ListingScreen({super.key});

  static const List<String> _columnsName = [
    '#', // for id or serial no
    'Name',
    'User',
    'Category',
    'Description',
    'Website',
    'Phone',
    'Location',
    'Latitude',
    'Longitude',
    'Area',
    'Services',
    'Tags',
    'Amenities',
    'Type',
    'Status',
    'Google Id',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(24),
          child: AppBreadCrumbs(locationName: RoutesName.listing),
        ),

        Expanded(
          child: DataTable2(
            headingRowColor: const MaterialStatePropertyAll(AppColors.white),
            dataRowColor: const MaterialStatePropertyAll(AppColors.white),
            columns: _columnsName
                .map((columnName) => DataColumn(label: Text(columnName)))
                .toList(),
            rows: dummyListings.map((listing) {
              return DataRow(
                cells: [
                  DataCell(Text(listing.id)),
                  DataCell(Text(listing.name)),
                  DataCell(Text(listing.user)),
                  DataCell(Text(listing.category)),
                  DataCell(Text(listing.description)),
                  DataCell(Text(listing.website)),
                  DataCell(Text(listing.phone)),
                  DataCell(Text(listing.location)),
                  DataCell(Text(listing.latitude)),
                  DataCell(Text(listing.longitude)),
                  DataCell(Text(listing.area)),
                  DataCell(Text(listing.services)),
                  DataCell(Text(listing.tags)),
                  DataCell(Text(listing.amenities)),
                  DataCell(Text(listing.type)),
                  DataCell(Text(listing.status)),
                  DataCell(Text(listing.googleId)),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
