import 'package:flutter/material.dart';
import 'package:flutter_admin/core/network/network_client.dart';
import 'package:flutter_admin/core/shared/repositories/remote_categories.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/core/widgets/app_breadcrumb.dart';
import 'package:get_it/get_it.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  static const List<String> _columnsName = [
    '#', // for id or serial no
    'Name',
    'Created At',
    'Last Updated At',
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
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: 1150,
                  child: PaginatedDataTable(
                    rowsPerPage: 8,
                    columns: _columnsName
                        .map(
                          (e) => DataColumn(label: Text(e)),
                        )
                        .toList(),
                    source: CategoryDataSource(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryDataSource extends DataTableSource {
  final RemoteCategory remoteCategory =
      RemoteCategory(client: GetIt.I<NetworkClient>().client);

  final List _data = List.generate(100, (index) => {
    'id': '$index',
    'name': 'name $index',
    'createdAt': '$index',
    'updatedAt': '$index',
  });

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]['id'])),
      DataCell(Text(_data[index]['name'])),
      DataCell(Text(_data[index]['createdAt'])),
      DataCell(Text(_data[index]['updatedAt'])),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 1;
}
