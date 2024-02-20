import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/core/widgets/app_breadcrumb.dart';
import 'package:flutter_admin/core/widgets/app_footer.dart';

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
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          color: Colors.green,
          height: 1000,
          child: Column(
            children: [
              ResponsiveDesignGrid(
                children: [
                  ResponsiveDesignGridRow(
                    children: [
                      ResponsiveDesignGridItem(
                        columns: const ResponsiveDesignGridColumns(small: 1,),
                        child: Container(color: Colors.blue),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        24.sbh,
        const AppFooter(),
      ],
    );
  }
}
