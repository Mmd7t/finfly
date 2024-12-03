import 'package:finfly/config/enums/enums.dart';

class OrdersModel {
  String? id;
  bool? isActive;
  String? price;
  String? company;
  String? picture;
  String? buyer;
  List<String>? tags;
  OrderStatusTypes? status;
  String? registered;

  OrdersModel({
    this.id,
    this.isActive,
    this.price,
    this.company,
    this.picture,
    this.buyer,
    this.tags,
    this.status,
    this.registered,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
        id: json['id'] as String?,
        isActive: json['isActive'] as bool?,
        price: json['price'] as String?,
        company: json['company'] as String?,
        picture: json['picture'] as String?,
        buyer: json['buyer'] as String?,
        tags: (json['tags'] as List<dynamic>).cast<String>(),
        status: OrderStatusTypes.fromJson(json['status'].toString()),
        registered: json['registered'] as String?,
      );
}
