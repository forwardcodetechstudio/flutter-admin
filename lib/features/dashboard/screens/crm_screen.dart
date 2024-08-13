import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/core/widgets/app_breadcrumb.dart';
import 'package:flutter_admin/core/widgets/app_footer.dart';
import 'package:flutter_admin/features/dashboard/widgets/crm_bar_chart.dart';
import 'package:flutter_admin/features/dashboard/widgets/crm_line_chart.dart';
import 'package:flutter_admin/features/dashboard/widgets/crm_pie_chart.dart';
import 'package:flutter_admin/features/dashboard/widgets/crm_scatter_chart.dart';
import 'package:flutter_admin/features/dashboard/widgets/custom_listtile.dart';

class CRMScreen extends StatelessWidget {
  const CRMScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(24),
          child: AppBreadCrumbs(locationName: RoutesName.crm),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: ResponsiveDesignGrid(
            useOuterPadding: false,
            defaultRowAlignment: DesignGridRowAlignment.center,
            children: [
              ResponsiveDesignGridRow(
                children: [
                  ResponsiveDesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 12,
                      medium: 4,
                    ),
                    child: CustomListTile(
                      title: 'Projects',
                      subtile: '89',
                      icon: Icon(Icons.folder_outlined),
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 12,
                      medium: 4,
                    ),
                    child: CustomListTile(
                      title: 'Tasks',
                      subtile: '259',
                      icon: Icon(Icons.drive_file_rename_outline_sharp),
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: ResponsiveDesignGridColumns(
                      small: 12,
                      medium: 4,
                    ),
                    child: CustomListTile(
                      title: 'Projects',
                      subtile: '57',
                      icon: Icon(Icons.people_outline_outlined),
                    ),
                  ),
                ],
              ),
              ResponsiveDesignGridRow(
                children: [
                  ResponsiveDesignGridItem(
                    columns:
                        ResponsiveDesignGridColumns(small: 12, medium: 6),
                    child: CRMLineChart(),
                  ),
                  ResponsiveDesignGridItem(
                    columns:
                        ResponsiveDesignGridColumns(small: 12, medium: 6),
                    child: CRMPieChart(),
                  ),
                  ResponsiveDesignGridItem(
                    columns:
                        ResponsiveDesignGridColumns(small: 12, medium: 6),
                    child: CRMBarChart(),
                  ),
                  ResponsiveDesignGridItem(
                    columns:
                        ResponsiveDesignGridColumns(small: 12, medium: 6),
                    child: CRMScatterChart(),
                  ),
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
