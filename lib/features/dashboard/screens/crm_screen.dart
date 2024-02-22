import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/constants/app_images.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/core/widgets/app_breadcrumb.dart';
import 'package:flutter_admin/core/widgets/app_footer.dart';
import 'package:flutter_admin/features/dashboard/models/progress_item.dart';
import 'package:flutter_admin/features/dashboard/widgets/custom_listtile.dart';
import 'package:flutter_admin/features/dashboard/widgets/linear_progress_graph.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ResponsiveDesignGrid(
            useOuterPadding: false,
            defaultRowAlignment: DesignGridRowAlignment.center,
            children: [
              const ResponsiveDesignGridRow(
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
                    columns: const ResponsiveDesignGridColumns(
                      small: 12,
                      medium: 6,
                      large: 4,
                    ),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            child: Text(
                              'Issues',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: CircularProgressIndicator(
                                value: 0.75,
                                strokeWidth: 6,
                                backgroundColor: Colors.grey[300],
                              ),
                            ),
                          ),
                          24.sbh,
                          Row(
                            children: [
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Open',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Icon(
                                          Icons.circle,
                                          color: AppColors.primary,
                                        )
                                      ],
                                    ),
                                    Text(
                                      '150',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              30.sbw,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.circle,
                                          color: Colors.grey[300],
                                        ),
                                        const Text(
                                          'Close',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: AppColors.grey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Text(
                                      '45',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          24.sbh,
                          const Divider(),
                          const SizedBox(
                            height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '75%',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                VerticalDivider(endIndent: 8),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'See All',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: const ResponsiveDesignGridColumns(
                      small: 12,
                      medium: 4,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      color: AppColors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Progress',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          30.sbh,
                          const LinearProgressGraph(
                            title: 'Project Think Tank',
                            items: [
                              ProgressItem(
                                  label: 'Prototyping',
                                  value: 75,
                                  barColor: AppColors.primary),
                              ProgressItem(
                                  label: 'Designing',
                                  value: 30,
                                  barColor: AppColors.green),
                              ProgressItem(
                                  label: 'Development',
                                  value: 50,
                                  barColor: AppColors.blue93b4d4),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Teams: ',
                                    style: TextStyle(
                                      color: AppColors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Positioned(
                                        child: Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: const BoxDecoration(
                                            color: AppColors.primary,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.person,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 20,
                                        child: Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: const BoxDecoration(
                                            color: AppColors.green,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.person,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    AppImages.paperclip,
                                    color: AppColors.grey,
                                    width: 15,
                                    height: 16,
                                  ),
                                  const Text(
                                    '5',
                                    style: TextStyle(
                                      color: AppColors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ResponsiveDesignGridItem(
                    columns: const ResponsiveDesignGridColumns(
                      small: 12,
                      medium: 4,
                    ),
                    child: Container(
                      color: AppColors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(
                                Icons.arrow_back_ios,
                                color: AppColors.grey,
                              ),
                              6.sbw,
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.grey,
                              )
                            ],
                          ),
                          24.sbh,
                          const Divider(),
                          const SizedBox(
                            height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Follow',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                VerticalDivider(
                                  endIndent: 8,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Message',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
