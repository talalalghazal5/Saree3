import 'package:flutter/material.dart';
import 'package:saree3/data/models/cart_item.dart';
import 'package:saree3/data/models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _cart = [
  ];

  List<CartItem> get cart => _cart;

  void addToCart(CartItem cartItem) {
    if (cart.contains(cartItem)) {
      cartItem.quantity++;
      notifyListeners();
    } else {
      cart.add(cartItem);
      notifyListeners();
    }
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  double get totalCartCost {
    double cost = 0.0;
    for (var cartItem in cart) {
      cost += cartItem.quantity;
    }
    return double.parse(cost.toStringAsFixed(2));
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

}
