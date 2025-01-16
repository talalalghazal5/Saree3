import 'package:flutter/material.dart';
import 'package:saree3/data/models/user.dart';

class UserController extends ChangeNotifier {
  User _user = User();
  User get user => _user;

  set user(User user) {
    _user = user;
    notifyListeners();
  }
}
