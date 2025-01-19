import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:saree3/data/models/user.dart';
import 'package:saree3/main.dart';

class ProfileServices {
  Uri baseUrl =
      Uri.parse('http://192.168.219.230:1234/api/profile');

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
      ).timeout(const Duration(minutes: 5));
      print("profile user: ${response.body}");
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        print(responseBody);
        return User.fromJson(responseBody['data']);
      } else if (response.statusCode == 404) {
        throw Exception('Error Occured');
      } else if (response.statusCode == 401) {
        preferences.setString('userToken', '');
        throw Exception('Unauthorized access.');
      } else {
        throw Exception('Unexpected server error.');
      }
    } on SocketException {
      throw Exception(
        'Failed to connect to the server. Please check your internet connection.',
      );
    } on ClientException catch (e) {
      throw Exception('Client error: ${e.message}');
    } catch (e) {
      throw {'message': 'Unauthenticated'};
    }
  }

  Future<int> updateProfile(File? image, String name, String address) async {
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
      request.files.add(
        MultipartFile(
          'profilePicture',
          image.readAsBytes().asStream(),
          image.lengthSync(),
          filename: image.path.split('/').last,
        ),
      );
    }

    var response = await request.send().timeout(
          const Duration(minutes: 5),
          onTimeout: () =>
              throw TimeoutException('Connection timed out please try again'),
        );
    int statusCode = response.statusCode;
    print(response);
    return statusCode;
  }
}
