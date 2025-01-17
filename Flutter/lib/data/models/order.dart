class Order {
  int id;
  int userId;
  double totalPrice;
  String orderStatus;
  DateTime? orderDate;

  Order({this.id = 0, this.userId = 0, this.totalPrice = 0.0, this.orderStatus = 'pending', this.orderDate});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      userId: json['userId'],
      totalPrice: json['totalPrice'],
      orderStatus: json['orderStatus'],
      orderDate: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['userId'] = userId;
    data['totalPrice'] = totalPrice;
    data['orderStatus'] = orderStatus;
    data['orderDate'] = orderDate;

    return data;
  }
}