import 'package:saree3/data/models/cart_item.dart';

class Order {
  int id;
  int userId;
  double totalPrice;
  String orderStatus;
  DateTime? orderDate;
  List<CartItem>? orderItems;

  Order({this.id = 0, this.userId = 0, this.totalPrice = 0.0, this.orderStatus = 'pending', this.orderDate, this.orderItems});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      
      id: json['id'],
      userId: json['userId'],
      totalPrice: (json['totalPrice'] as num).toDouble(),
      orderStatus: json['orderStatus'],
      orderDate: DateTime.parse(json['createdAt'] as String),
      orderItems: (json['orderItems'] as List<dynamic>).map((item) => CartItem.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['userId'] = userId;
    data['totalPrice'] = totalPrice;
    data['orderStatus'] = orderStatus;
    data['orderDate'] = orderDate;
    data['orderItems'] = orderItems!.map((item) => item.toJson()).toList();
    return data;
  }
}