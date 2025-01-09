import 'package:http/http.dart' as http;

class AuthServices {
  Future<void> register(
      {required String name,
      required String phone_number,
      required String password,
      required String password_confirmation}) async {
    Map<String, String> headers = {"accept": "application/json"};

    Object body = {
      "name": name,
      "phone_number": phone_number,
      "password": password,
      "password_confirmation": password_confirmation,
    };

    await http.post(Uri.parse("http://192.168.248.230:8000/test/register"),
        body: body, headers: headers);
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

    await http.post(Uri.parse("http://192.168.248.230:8000/login"),
        body: body, headers: headers);
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

    await http.post(Uri.parse("http://192.168.248.230:8000/test/verify"),
        body: body, headers: headers);
  }
}
