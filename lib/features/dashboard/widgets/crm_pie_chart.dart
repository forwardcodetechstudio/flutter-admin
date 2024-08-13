import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/features/dashboard/models/data_model.dart';

class CRMPieChart extends StatelessWidget {
  const CRMPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    // colors
    final background = Theme.of(context).colorScheme.background;
    final onBackground = Theme.of(context).colorScheme.onBackground;

    return Container(
      padding: const EdgeInsets.all(24),
      color: background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pie Chart',
            style: TextStyle(
              color: onBackground,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          40.sbh,
          AspectRatio(
            aspectRatio: 16 / 9,
            child: PieChart(
              PieChartData(
                sections: sampleData
                    .map(
                      (data) => PieChartSectionData(
                        value: data.y,
                        color: data.color,
                        titleStyle: TextStyle(color: onBackground),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
