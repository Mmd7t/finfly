part of 'home_cubit.dart';

abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersLoaded extends OrdersState {
  final List<OrdersModel> orders;
  final Map<String, int> monthlyOrders;
  final int totalOrders;
  final double averagePrice;
  final int returnsCount;

  OrdersLoaded(this.orders, this.monthlyOrders, this.totalOrders,
      this.averagePrice, this.returnsCount);
}

class OrdersError extends OrdersState {
  final String message;

  OrdersError(this.message);
}
