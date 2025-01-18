import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:saree3/data/models/cart_item.dart';
import 'package:saree3/data/models/order.dart';
import 'package:saree3/data/models/user.dart';
import 'package:saree3/main.dart';

class OrderService {
  Uri baseUrl =
      Uri.parse('https://b363-169-150-218-58.ngrok-free.app/api/myorders');
  Future<Order> placeNewOrder(List<CartItem> order) async {
    try {
      if (order.isEmpty) {
        print('Order list is empty');
        throw Exception('Your cart is empty, order some products first');
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
        throw Exception('session expired, please login again');
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

      if (response.statusCode == 201) {
        var orderInJson = jsonDecode(response.body);
        Order placedOrder = Order.fromJson(orderInJson);

        return placedOrder;
      }
      throw Exception('An Error Occured while getting order details');
    } on SocketException catch (e) {
      throw e.message;
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<List<Order>> getOrders() async {
    try {
      var token = preferences.getString('userToken');
      if (token == null) {
        print('Token is null');
        throw Exception('session expired, please login again');
      }

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var response = await get(baseUrl, headers: headers);

      if (response.statusCode == 200) {
        print(response.body);
        List<dynamic> responseBody = jsonDecode(response.body);
        List<Order> orderList = responseBody
            .map(
              (order) => Order.fromJson(order),
            )
            .toList();
        return orderList;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<Order>> getOrdersByStatus(String status) async {
    try {
      var token = preferences.getString('userToken');
      if (token == null) {
        print('Token is null');
        throw Exception('session expired, please login again');
      }

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var response =
          await get(Uri.parse('$baseUrl?status=$status'), headers: headers)
              .timeout(Duration(minutes: 5));

      if (response.statusCode == 200) {
        List<dynamic> responseBody = jsonDecode(response.body);
        List<Order> orderList = responseBody
            .map(
              (order) => Order.fromJson(order),
            )
            .toList();
        return orderList;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw e;
    }
  }

  Future<Order> getOrderById(int id) async {
    try {
      var token = preferences.getString('userToken');
      if (token == null) {
        print('Token is null');
        throw Exception('session expired, please login again');
      }

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var response =
          await get(Uri.parse('$baseUrl/id'), headers: headers)
              .timeout(Duration(minutes: 5));

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        Order order = Order.fromJson(responseBody);
        return order;
      } else {
        print(response.reasonPhrase);
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw e;
    }
  }
}
