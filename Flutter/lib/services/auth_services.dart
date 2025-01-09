import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:saree3/main.dart';

class AuthServices {
  Uri baseUrl = Uri.parse('https://cee8-149-22-80-110.ngrok-free.app');

  Future<Map<String, dynamic>> register({
    required String name,
    required String phone_number,
    required String password,
    required String password_confirmation,
  }) async {
    Map<String, String> headers = {"accept": "application/json"};

    Object body = {
      "name": name,
      "phone_number": phone_number,
      "password": password,
      "password_confirmation": password_confirmation,
    };

    try {
      var response = await post(
        Uri.parse("$baseUrl/test/register"),
        body: body,
        headers: headers,
      );
      print("regiseterd user: ${response.body}");
      var responseBody = jsonDecode(response.body);
      var responseData = {
        'message': responseBody['message'],
        'statusCode ': response.statusCode
      };
      return responseData;
    } on SocketException catch (e) {
      return {'message': e.message};
    }
  }

  Future<Map<String, dynamic>> signIn({
    required String phone_number,
    required String password,
  }) async {
    Map<String, String> headers = {"accept": "application/json"};

    Object body = {
      "phone_number": phone_number,
      "password": password,
    };

    try {
      var response =
          await post(Uri.parse("$baseUrl/login"), body: body, headers: headers);
      print('---------------- Logging in: ${response.body} ------------------');
      var responseBody = jsonDecode(response.body);
      var token = responseBody['token'];
      await preferences.setString('userToken', token ?? '');
      var responseData = {
        'message': responseBody['message'],
        'statusCode': response.statusCode,
      };
      return responseData;
    } on Exception catch (e) {
      return {'message': e.toString()};
    }
  }

  Future<Map<String, dynamic>> verify({
    required String verification_code,
    required String phone_number,
  }) async {
    Map<String, String> headers = {
      "Accept": "application/json",
    };

    Object body = {
      "phone_number": phone_number,
      "verification_code": verification_code
    };
    print(body);
    try {
      var response = await post(
        Uri.parse("$baseUrl/test/verify"),
        body: body,
        headers: headers,
      );

      print('----- Verified: ${response.body} ------');
      var responseBody = jsonDecode(response.body);
      var token = responseBody['token'] ?? '';
      await preferences.setString('userToken', token);
      var responseData = {
        'message': responseBody['message'],
        'statusCode': response.statusCode
      };
      print(
        '----------------- M Y  T O K E N  I S: $token ----------------------------',
      );
      return responseData;
    } on Exception catch (e) {
      return {'message': e.toString()};
      // print(e.toString());
    }
  }

  Future<void> logout() async {
    try {
  await post(Uri.parse('$baseUrl/logout'));
  preferences.setString('userToken', '');
} on Exception catch (e) {
  print(e.toString());
}
  }
}
