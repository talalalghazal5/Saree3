import 'package:http/http.dart';
import 'package:saree3/data/models/cart_item.dart';
import 'package:saree3/main.dart';

class OrderService {
  Future<void> placeNewOrder(List<CartItem> order) async {
    var orders = order
        .map(
          (item) => item.toJson(),
        )
        .toList();

    Map<String, dynamic> body = Map<String, dynamic>();

    if (order.isNotEmpty) {
      body['items'] = order.map((item) => item.toJson()).toList();
    }
    var token = preferences.getString('userToken');
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await post(
        Uri.parse('https://3eda-89-33-8-58.ngrok-free.app/api/myorders'),
        body: body,
        headers: headers);

    print(response.body);
  }
}
