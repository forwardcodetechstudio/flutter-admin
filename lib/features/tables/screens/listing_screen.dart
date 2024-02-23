import 'package:flutter/material.dart';
import 'package:flutter_admin/features/tables/models/listing.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/core/widgets/app_breadcrumb.dart';
import 'package:flutter_admin/features/tables/bloc/listing_bloc.dart';
import 'package:get_it/get_it.dart';

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
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const AppBreadCrumbs(locationName: RoutesName.listing),
          24.sbh,
          Expanded(
            child: SingleChildScrollView(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: BlocBuilder<ListingBloc, ListingState>(
                  bloc: GetIt.I<ListingBloc>(),
                  builder: (context, state) {
                    final List<Listing> listings =
                        (state as ListingInitial).listings;
                    return DataTable(
                      headingRowColor:
                          const MaterialStatePropertyAll(AppColors.white),
                      dataRowColor:
                          const MaterialStatePropertyAll(AppColors.white),
                      columns: _columnsName
                          .map((columnName) =>
                              DataColumn(label: Text(columnName)))
                          .toList(),
                      rows: listings.map((listing) {
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
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
