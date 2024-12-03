import 'package:easy_localization/easy_localization.dart';
import 'package:finfly/config/extensions/extensions.dart';
import 'package:finfly/config/extensions/text_extensions.dart';
import 'package:finfly/config/routes/app_routes.dart';
import 'package:finfly/core/models/orders_model.dart';
import 'package:finfly/core/widgets/global_appbar.dart';
import 'package:finfly/features/home/cubit/home_cubit.dart';
import 'package:finfly/features/home/widgets/order_card.dart';
import 'package:finfly/features/home/widgets/orders_metrics.dart';
import 'package:finfly/features/settings/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    var themeCubit = context.watch<ThemeCubit>().state;
    return Scaffold(
      appBar: GlobalAppBar(title: "Orders".tr()),
      body: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          if (state is OrdersLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is OrdersError) {
            return Center(child: Text(state.message));
          } else if (state is OrdersLoaded) {
            final orders = state.orders;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: OrdersMetrics(
                      totalOrders: state.totalOrders,
                      averagePrice: state.averagePrice,
                      returnsCount: state.returnsCount,
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.all(10)),
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "All Orders".tr().titleSmall(
                              context,
                              color: (themeCubit is DarkState)
                                  ? Colors.white
                                  : Colors.black,
                            ),
                        InkWell(
                          onTap: () => context.push(Routes.graphs),
                          child: "Graphs".tr().body(context,
                              decoration: TextDecoration.underline,
                              color: context.color.primary),
                        ),
                      ],
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.all(6)),
                  SliverList.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final OrdersModel order = orders[index];
                      return OrderCard(order: order);
                    },
                  ),
                ],
              ),
            );
          }
          return const Center(child: Text('Press the button to load orders.'));
        },
      ),
    );
  }
}
