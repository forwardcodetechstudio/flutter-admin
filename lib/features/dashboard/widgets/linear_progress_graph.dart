import 'package:flutter/material.dart';
import 'package:flutter_admin/config/theme/cubit/theme_cubit.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/features/dashboard/models/progress_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LinearProgressGraph extends StatelessWidget {
  final String title;
  final List<ProgressItem> items;

  const LinearProgressGraph({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final bool isLightThemeActive = state is! DarkTheme;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: isLightThemeActive ? AppColors.black : AppColors.white,
              ),
            ),
            24.sbh,
            ...items.map(
              (item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.label,
                            style: const TextStyle(
                              color: AppColors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '${item.value}%',
                            style: const TextStyle(
                              color: AppColors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      10.sbh,
                      LinearProgressIndicator(
                        semanticsLabel: item.label,
                        semanticsValue: item.value.toString(),
                        value: item.value * 0.01,
                        color: item.barColor,
                      )
                    ],
                  ),
                );
              },
            ).toList()
          ],
        );
      },
    );
  }
}
