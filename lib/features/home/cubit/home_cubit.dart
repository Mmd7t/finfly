import 'dart:convert';
import 'package:finfly/core/models/orders_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
part 'home_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());
  Future<void> loadOrders() async {
    emit(OrdersLoading());

    try {
      // Load JSON from assets
      final String jsonString =
          await rootBundle.loadString('assets/data/orders.json');
      final List<dynamic> orders = json.decode(jsonString);

      int totalOrders = orders.length;
      double totalPrice = 0.0;
      int returnsCount = 0;

      final Map<String, int> monthlyOrders = {};
      for (var order in orders) {
        final DateTime date = DateTime.parse(order['registered']);
        final String monthYear =
            "${date.year}-${date.month.toString().padLeft(2, '0')}";

        monthlyOrders[monthYear] = (monthlyOrders[monthYear] ?? 0) + 1;

        double price = double.tryParse(
                order['price']?.replaceAll('\$', '').replaceAll(',', '') ??
                    '0') ??
            0.0;
        totalPrice += price;

        if (order['status'] == 'RETURNED') {
          returnsCount++;
        }
      }

      double averagePrice = totalOrders > 0 ? totalPrice / totalOrders : 0;

      List<OrdersModel> ordersModel =
          orders.map((order) => OrdersModel.fromJson(order)).toList();

      emit(OrdersLoaded(
          ordersModel, monthlyOrders, totalOrders, averagePrice, returnsCount));
    } catch (e) {
      emit(OrdersError('Failed to load orders: ${e.toString()}'));
    }
  }

  Future<Map<String, dynamic>> processData(List<dynamic> jsonData) async {
    final totalOrders = jsonData.length;

    // Group orders by status
    final orderStatuses = jsonData.fold<Map<String, int>>({}, (acc, order) {
      final status = order['status'] ?? 'UNKNOWN';
      acc[status] = (acc[status] ?? 0) + 1;
      return acc;
    });

    // Group orders by month
    final monthlyOrders = jsonData.fold<Map<String, int>>({}, (acc, order) {
      final date = DateTime.parse(order['registered']);
      final key = "${date.year}-${date.month.toString().padLeft(2, '0')}";
      acc[key] = (acc[key] ?? 0) + 1;
      return acc;
    });

    return {
      'totalOrders': totalOrders,
      'orderStatuses': orderStatuses,
      'monthlyOrders': monthlyOrders,
    };
  }

  Future<Map<String, int>> processOrdersData(String assetPath) async {
    // Load JSON from assets
    final String jsonString = await rootBundle.loadString(assetPath);
    final List<dynamic> orders = json.decode(jsonString);

    // Process data to count orders by month-year
    final Map<String, int> monthlyOrders = {};
    for (var order in orders) {
      final DateTime date = DateTime.parse(order['registered']);
      final String monthYear =
          "${date.year}-${date.month.toString().padLeft(2, '0')}";

      monthlyOrders[monthYear] = (monthlyOrders[monthYear] ?? 0) + 1;
    }

    return monthlyOrders;
  }
}
