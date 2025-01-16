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
      orderDate: json['createdAt'],
    );
  }
}
