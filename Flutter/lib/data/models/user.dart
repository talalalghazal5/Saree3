import 'package:flutter/foundation.dart';

class User {
    int? id;
    String? name;
    String? phone_number;
    String? location;
    String? profilePictureUrl;
    User({ this.id  , this.name , this.phone_number , this.location , this.profilePictureUrl });

    factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      phone_number:json['phoneNumber'],
      location:json['location']??"",
      profilePictureUrl:json['profilePictureUrl']??"",
    );
  }
  
}