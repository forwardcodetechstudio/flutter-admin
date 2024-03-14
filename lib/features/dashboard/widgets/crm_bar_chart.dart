import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/features/dashboard/models/data_model.dart';

class CRMBarChart extends StatelessWidget {
  const CRMBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    // colors
    final background = Theme.of(context).colorScheme.background;
    final onBackground = Theme.of(context).colorScheme.onBackground;
    final secondary = Theme.of(context).colorScheme.secondary;

    return Container(
      padding: const EdgeInsets.all(24),
      color: background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bar Chart',
            style: TextStyle(
              color: onBackground,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          40.sbh,
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BarChart(
              BarChartData(
                  titlesData: FlTitlesData(
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            Months.values[value.toInt()].name,
                            style: TextStyle(color: onBackground),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toString(),
                            style: TextStyle(color: onBackground),
                          );
                        },
                      ),
                    ),
                  ),
                  gridData: FlGridData(
                    drawHorizontalLine: true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) =>
                        FlLine(color: secondary, strokeWidth: 0.5),
                  ),
                  borderData: FlBorderData(
                    border: Border(
                      bottom: BorderSide(color: secondary),
                    ),
                  ),
                  barGroups: sampleData
                      .map((data) =>
                          BarChartGroupData(x: data.x.index, barRods: [
                            BarChartRodData(toY: data.y),
                          ]))
                      .toList()),
            ),
          ),
        ],
      ),
    );
  }
}
