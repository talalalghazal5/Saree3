import 'package:flutter/material.dart';
import 'package:saree3/UI/themes/dark_theme.dart';
import 'package:saree3/UI/themes/light_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightTheme;

  ThemeData get themeData => _themeData;
  bool get isDarkMode => _themeData == darkTheme;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == darkTheme) {
      themeData = lightTheme;
    } else {
      themeData = darkTheme;
    }
  }
}