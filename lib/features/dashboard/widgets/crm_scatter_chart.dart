import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/features/dashboard/models/data_model.dart';

class CRMScatterChart extends StatelessWidget {
  const CRMScatterChart({super.key});

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
            'Scatter Chart',
            style: TextStyle(
              color: onBackground,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          40.sbh,
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ScatterChart(
              ScatterChartData(
                minY: 0,
                maxY: 150,
                titlesData: FlTitlesData(
                  rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
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
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 30,
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
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: secondary,
                    strokeWidth: 0.5,
                  ),
                ),
                borderData: FlBorderData(
                  border: Border(
                    bottom: BorderSide(color: secondary),
                  ),
                ),
                scatterSpots: sampleData
                    .map(
                      (data) => ScatterSpot(
                        data.x.index.toDouble(),
                        data.y,
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
