import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:saree3/data/models/user.dart';
import 'package:saree3/main.dart';

class ProfileServices {
  Uri baseUrl = Uri.parse('https://81d2-169-150-218-135.ngrok-free.app');

  Future<User> profile() async {
    var token = preferences.getString('userToken')!;
    Map<String, String> headers = {
      "accept": "application/json",
      "Authorization": "Bearer $token"
    };

    try {
      var response = await get(
        baseUrl,
        headers: headers,
      );
      print("profile user: ${response.body}");
      if (response.statusCode != 404) {
        var responseBody = jsonDecode(response.body);
        // print("profile user: ${response.body}");
        print(responseBody);
        var responseData = {
          'message': responseBody['message'],
          'statusCode ': response.statusCode,
          'persistentConnection': response.persistentConnection
        };
        return User.fromJson(responseBody['data']);
      }
      print(User().name);
      return User();
    } on SocketException catch (e) {
      throw {'message': e.message};
    }
  }

  Future<void> updateProfile(File? image, String name, String address) async {
    var token = preferences.getString('userToken')!;
    Map<String, String> headers = {
      "accept": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, String> body = {
      "name": name,
      "location": address,
    };

    var request = MultipartRequest(
      "POST",
      baseUrl,
    );
    request.headers.addAll(headers);

    request.fields.addAll(body);

    if (image != null) {
      request.files.add(MultipartFile(
          'profilePicture', image.readAsBytes().asStream(), image.lengthSync(),
          filename: image.path.split('/').last));
    }

    var response = await request.send();
    print(response);
  }
}
