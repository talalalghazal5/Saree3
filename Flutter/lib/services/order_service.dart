import 'dart:convert';

import 'package:http/http.dart';
import 'package:saree3/data/models/cart_item.dart';
import 'package:saree3/main.dart';

class OrderService {
  Uri baseUrl =
      Uri.parse('https://e4a4-169-150-218-18.ngrok-free.app/api/myorders');
  Future<void> placeNewOrder(List<CartItem> order) async {
    if (order.isEmpty) {
      print('Order list is empty');
      return;
    }

    var orders = order.map((item) => item.toJson()).toList();
    print('Orders List: $orders');

    Object body = {
      'items': orders,
    };

    print('Request Body Before JSON Encoding: $body');

    var token = preferences.getString('userToken');
    if (token == null) {
      print('Token is null');
      return;
    }

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var jsfiedBody = jsonEncode(body);
    print('JSON Body: $jsfiedBody');

    var response = await post(
      baseUrl,
      body: jsfiedBody,
      headers: headers,
    );

    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');
  }
}
