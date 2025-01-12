import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:saree3/data/models/user.dart';
import 'package:saree3/main.dart';

class ProfileServices {
  Uri baseUrl = Uri.parse('https://81d2-169-150-218-135.ngrok-free.app');

  Future<User> profile() async {

    var token=preferences.getString('userToken')!;
    Map<String, String> headers = {"accept": "application/json",
    "Authorization":"Bearer $token"};

    

    try {
      var response = await get(
        Uri.parse("$baseUrl/api/profile"),
        headers: headers,
      );
      //print("profile user: ${response.body}");
      if (response.statusCode != 404) {
        var responseBody = jsonDecode(response.body);
              // print("profile user: ${response.body}");
print(responseBody);
      var responseData = {
        'message': responseBody['message'],
        'statusCode ': response.statusCode,
        'persistentConnection' : response.persistentConnection
      };
      return User.fromJson(responseBody);
      
      }
      print(User().name);
      return User();
    } on SocketException catch (e) {
      throw{'message': e.message};
    }
  }
}