import 'package:easy_localization/easy_localization.dart';
import 'package:finfly/config/extensions/extensions.dart';
import 'package:finfly/config/extensions/icons_extensions.dart';
import 'package:finfly/core/widgets/global_appbar.dart';
import 'package:finfly/features/home/cubit/home_cubit.dart';
import 'package:finfly/features/home/widgets/graphs/bar_chart.dart';
import 'package:finfly/features/home/widgets/graphs/line_chart.dart';
import 'package:finfly/features/home/widgets/graphs/scatter_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GraphsPage extends StatelessWidget {
  const GraphsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: "Graph".tr()),
      body: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          if (state is OrdersLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is OrdersError) {
            return Center(child: Text(state.message));
          } else if (state is OrdersLoaded) {
            final data = state.monthlyOrders;
            return DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: context.color.secondary,
                    dividerColor: Colors.transparent,
                    tabs: [
                      Tab(
                        icon: "bar-chart".iconProvider(context),
                      ),
                      Tab(
                        icon: "line-chart".iconProvider(context),
                      ),
                      Tab(
                        icon: "scatter-chart".iconProvider(context),
                      ),
                    ],
                  ).decorate(
                    context,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        SyncfusionBarChart(data: data),
                        SyncfusionLineChart(data: data),
                        SyncfusionScatterChart(data: data),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: Text('No data available'));
        },
      ),
    );
  }
}
