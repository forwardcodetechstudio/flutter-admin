import 'package:flutter/material.dart';
import 'package:flutter_admin/base/stateless_page.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/features/tables/models/listing.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/core/widgets/app_breadcrumb.dart';
import 'package:flutter_admin/features/tables/bloc/listing/listing_bloc.dart';

class ListingScreen extends StatelessPage<ListingBloc> {
  ListingScreen({super.key});

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
    final surface = Theme.of(context).colorScheme.surface;
    final onBackground = Theme.of(context).colorScheme.onBackground;

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
                  bloc: bloc,
                  builder: (context, state) {
                    final List<Listing> listings = state.listings;
                    return DataTable(
                      headingRowColor: WidgetStatePropertyAll(surface),
                      dataRowColor: WidgetStatePropertyAll(surface),
                      headingTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: onBackground
                      ),
                      dataTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: onBackground
                      ),
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
