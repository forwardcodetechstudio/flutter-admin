import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/core/widgets/input_box.dart';

class CustomTable extends StatelessWidget {
  final List<Widget> columns;
  final List<List<Widget>> rows;
  final VoidCallback? onSearchButtonTap;
  final TextEditingController? searchTextEditingController;
  final int totalPage;
  final int currentPage;
  final int rowsPerPage;
  final double breakPoint;
  final VoidCallback? onNextPageButtonClicked;
  final VoidCallback? onPrevPageButtonClicked;
  // this method will create a custom list item with developer need
  final Widget Function(List<Widget> row) listViewLayoutBuilder;

  const CustomTable({
    Key? key,
    required this.columns,
    required this.rows,
    this.onSearchButtonTap,
    this.searchTextEditingController,
    required this.totalPage,
    required this.currentPage,
    this.onNextPageButtonClicked,
    this.onPrevPageButtonClicked,
    required this.rowsPerPage,
    required this.listViewLayoutBuilder,
    this.breakPoint = 700,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return LayoutBuilder(
      builder: (context, constraints) {
        double tableWidth = constraints.maxWidth;
        if (tableWidth < 700) {
          tableWidth = 700;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchField(),
            Expanded(
              child: (screenWidth > breakPoint)
                  ? _displayDataInTable(tableWidth: tableWidth)
                  : _displayDataInListView(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('1 - $totalPage of $currentPage'),
                8.sbw,
                IconButton(
                  onPressed: (currentPage > 1) ? onPrevPageButtonClicked : null,
                  icon: const Icon(Icons.arrow_back_ios_new),
                  iconSize: 18,
                ),
                IconButton(
                  onPressed: (currentPage < totalPage)
                      ? onNextPageButtonClicked
                      : null,
                  icon: const Icon(Icons.arrow_forward_ios),
                  iconSize: 18,
                ),
              ],
            )
          ],
        );
      },
    );
  }

  Widget _searchField() {
    return SizedBox(
      width: 350,
      child: InputBox(
        placeholder: 'Search',
        suffixIcon: InkWell(
          onTap: onSearchButtonTap,
          child: const Icon(Icons.search),
        ),
        textEditingController: searchTextEditingController,
      ),
    );
  }

  Widget _displayDataInTable({required double tableWidth}) {
    return SingleChildScrollView(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            SizedBox(
              width: tableWidth,
              child: DataTable(
                headingRowColor:
                    const MaterialStatePropertyAll(AppColors.white),
                dataRowColor: const MaterialStatePropertyAll(AppColors.white),
                columns:
                    columns.map((column) => DataColumn(label: column)).toList(),
                rows: rows.map((row) {
                  return DataRow(
                    cells: row.map((cell) => DataCell(cell)).toList(),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _displayDataInListView() {
    return ListView(
      children: rows.map(
        (row) {
          final listView = listViewLayoutBuilder(row);
          return Column(children: [
            listView,
            const Divider(),
          ]);
        },
      ).toList(),
    );
  }
  // Widget _displayDataInListView() {
  //   return ListView(
  //     children: rows.map(
  //       (row) {
  //         return Column(children: [
  //           ...row
  //               .map((cell) => ListTile(
  //                     title: cell,
  //                     tileColor: Colors.white,
  //                   ))
  //               .toList(),
  //           const Divider(),
  //         ]);
  //       },
  //     ).toList(),
  //   );
  // }
}
