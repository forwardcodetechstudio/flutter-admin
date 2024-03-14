import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/features/dashboard/models/data_model.dart';

class CRMLineChart extends StatelessWidget {
  const CRMLineChart({super.key});

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
            'Line Chart',
            style: TextStyle(
              color: onBackground,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          40.sbh,
          AspectRatio(
            aspectRatio: 16 / 9,
            child: LineChart(
              LineChartData(
                minY: 0,
                maxY: 150,
                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(drawBelowEverything: false),
                  rightTitles: const AxisTitles(drawBelowEverything: false),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      reservedSize: 30,
                      showTitles: true,
                      interval: 30,
                      getTitlesWidget: (value, meta) => Text(
                        value.toString(),
                        style: TextStyle(color: onBackground),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      reservedSize: 40,
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          Months.values[value.toInt()].name,
                          style: TextStyle(color: onBackground),
                        );
                      },
                    ),
                  ),
                ),
                gridData: FlGridData(
                  drawHorizontalLine: true,
                  drawVerticalLine: false,
                  horizontalInterval: 29.99,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(color: secondary, strokeWidth: 0.5);
                  },
                ),
                borderData: FlBorderData(
                  border: Border(
                    bottom: BorderSide(color: secondary),
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    barWidth: 5,
                    color: AppColors.blue0080ff,
                    dotData: const FlDotData(show: false),
                    spots: sampleData
                        .map(
                          (data) => FlSpot(
                            data.x.index.toDouble(),
                            data.y,
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
