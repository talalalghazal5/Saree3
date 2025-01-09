import 'dart:io';

import 'package:http/http.dart';

class AuthServices {
  Uri baseUrl = Uri.parse('https://383a-149-102-244-100.ngrok-free.app');

  Future<void> register({
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
      var response = await post(Uri.parse("$baseUrl/test/register"),
          body: body, headers: headers);
      print("regiseterd user: ${response.body}");
    } on SocketException catch (e) {
      throw e.message;
    }
  }

  Future<void> signIn({
    required String phone_number,
    required String password,
  }) async {
    Map<String, String> headers = {"accept": "application/json"};

    Object body = {
      "phone_number": phone_number,
      "password": password,
    };

    await post(Uri.parse("$baseUrl/login"), body: body, headers: headers);
  }

  Future<void> verify(
      {required String verification_code, required String phone_number}) async {
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
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
