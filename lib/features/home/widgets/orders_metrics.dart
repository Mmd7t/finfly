import 'package:easy_localization/easy_localization.dart';
import 'package:finfly/config/extensions/extensions.dart';
import 'package:finfly/features/home/widgets/metric_tile.dart';
import 'package:flutter/material.dart';

class OrdersMetrics extends StatelessWidget {
  final int totalOrders;
  final double averagePrice;
  final int returnsCount;

  const OrdersMetrics({
    super.key,
    required this.totalOrders,
    required this.averagePrice,
    required this.returnsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MetricTile(title: "Total Orders".tr(), value: "$totalOrders"),
        MetricTile(
            title: "Average Price".tr(),
            value: "\$${averagePrice.toStringAsFixed(2)}"),
        MetricTile(title: "Returns".tr(), value: "$returnsCount"),
      ],
    ).decorate(context, padding: const EdgeInsets.all(16));
  }
}
