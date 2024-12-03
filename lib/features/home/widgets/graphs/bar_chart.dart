import 'package:easy_localization/easy_localization.dart';
import 'package:finfly/config/extensions/extensions.dart';
import 'package:finfly/config/extensions/responsive_extensions.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SyncfusionBarChart extends StatelessWidget {
  final Map<String, int> data;

  const SyncfusionBarChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final sortedKeys = data.keys.toList()..sort();
    final chartData =
        sortedKeys.map((key) => ChartData(key, data[key]!)).toList();

    return UnconstrainedBox(
      child: SizedBox(
        height: 300,
        width: context.width * 0.9,
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(
            title: AxisTitle(text: 'date'.tr()),
            tickPosition: TickPosition.inside,
          ),
          primaryYAxis: NumericAxis(
            title: AxisTitle(text: "no. of orders".tr()),
            tickPosition: TickPosition.inside,
          ),
          title: ChartTitle(text: "Orders Chart".tr()),
          series: [
            ColumnSeries<ChartData, String>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(50),
              ),
              color: context.color.primary,
              animationDuration: 1200,
              gradient: LinearGradient(
                colors: [
                  context.color.primary,
                  context.color.primary.withOpacity(0.7),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ],
          enableAxisAnimation: true,
          enableMultiSelection: true,
        ),
      ).decorate(
        context,
        padding: const EdgeInsets.all(8),
      ),
    );
  }
}

class ChartData {
  final String x;
  final int y;

  ChartData(this.x, this.y);
}
