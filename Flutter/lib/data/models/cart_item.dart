import 'package:saree3/data/models/product.dart';

class CartItem {
  Product product;
  int quantity;

  double get totalCost => (product.price! * quantity).roundToDouble();

  CartItem({required this.product, required this.quantity});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: json['product'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = product.id;
    data['quantity'] = quantity;

    return data;
  }
}
