import 'package:easy_localization/easy_localization.dart';
import 'package:finfly/config/extensions/extensions.dart';
import 'package:finfly/config/extensions/responsive_extensions.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SyncfusionScatterChart extends StatelessWidget {
  final Map<String, int> data;

  const SyncfusionScatterChart({super.key, required this.data});

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
          title: ChartTitle(text: "Orders Chart".tr()),
          primaryXAxis: const CategoryAxis(),
          enableAxisAnimation: true,
          series: [
            ScatterSeries<ChartData, String>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              markerSettings: const MarkerSettings(
                height: 10,
                width: 10,
                shape: DataMarkerType.circle,
                color: Colors.purple,
              ),
            ),
          ],
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