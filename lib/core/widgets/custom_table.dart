import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';

class CustomTable extends StatelessWidget {
  final List<Widget> columns;
  final List<List<Widget>> rows;
  final Function(String value)? onSearchTextChanged;
  final TextEditingController? searchTextEditingController;
  final int totalPage;
  final int currentPage;
  final int rowsPerPage;
  final double breakPoint;
  final VoidCallback? onNextPageButtonClicked;
  final VoidCallback? onPrevPageButtonClicked;
  final bool isLoading;
  // this method will create a custom list item with developer need
  final Widget Function(List<Widget> row) listViewLayoutBuilder;

  const CustomTable({
    Key? key,
    required this.columns,
    required this.rows,
    this.onSearchTextChanged,
    this.searchTextEditingController,
    required this.totalPage,
    required this.currentPage,
    required this.rowsPerPage,
    this.breakPoint = 700,
    this.onNextPageButtonClicked,
    this.onPrevPageButtonClicked,
    this.isLoading = false,
    required this.listViewLayoutBuilder,
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

        // background color of theme, handle theme change
        final Color background = Theme.of(context).colorScheme.background;
        final Color onBackground = Theme.of(context).colorScheme.onBackground;

        return Container(
          decoration: BoxDecoration(
            color: background,
            border: Border.all(color: AppColors.white),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _searchField(textColor: onBackground),
              isLoading
                  ? const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Expanded(
                      child: (screenWidth > breakPoint)
                          ? _displayDataInTable(
                              tableWidth: tableWidth,
                            )
                          : _displayDataInListView(),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '1 - $totalPage of $currentPage',
                    style: TextStyle(color: onBackground),
                  ),
                  8.sbw,
                  IconButton(
                    onPressed:
                        (currentPage > 1) ? onPrevPageButtonClicked : null,
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
          ),
        );
      },
    );
  }

  Widget _searchField({required Color textColor}) {
    return Container(
      width: 350,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: TextField(
        onChanged: onSearchTextChanged,
        style: TextStyle(color: textColor),
        decoration: const InputDecoration(
          suffixIcon: Icon(Icons.search),
          hintText: 'Search',
          contentPadding: EdgeInsets.symmetric(horizontal: 14),
          border: OutlineInputBorder(),
        ),
        controller: searchTextEditingController,
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
}
