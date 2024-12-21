import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    surface: Color(0xffFFFFF7),
    primary: Color(0xff3D21DB),
    onPrimary: Color(0xffFFFFF7),
    secondary: Color(0xff240CAA),
    onSecondary: Color(0xffFFFFF7),
    tertiary: Color(0xffFF7F50),
    onSurface: Color(0xff25242b),
    surfaceContainer: Color(0xff626165),
    error: Color(0xffDE2C2C),
    errorContainer: Color(0xffB71212),
    onError: Color(0xffFFFFF7),
    inverseSurface: Color(0xffB2B1B6),
  ),
  textTheme: const TextTheme(
// =========== H E A D L I N E =========
    headlineLarge: TextStyle(
      fontSize: 27,
      color: Color(0xff25242b),
      fontFamily: 'lexend',
    ),
    headlineMedium: TextStyle(
      fontSize: 23,
      color: Color(0xff25242b),
      fontFamily: 'lexend',
    ),

// =========== B O D Y =================
    bodyLarge: TextStyle(
      fontSize: 18,
      color: Color(0xff25242b),
      fontFamily: 'lexend',
    ),
    bodyMedium: TextStyle(
      fontSize: 15,
      color: Color(0xff25242b),
      fontFamily: 'lexend',
    ),
    bodySmall: TextStyle(
      fontSize: 13,
      color: Color(0xff25242b),
      fontFamily: 'lexend',
    ),
// =========== L A B E L ===============
    labelSmall: TextStyle(
      fontSize: 15,
      color: Color(0xffFF7F50),
      fontFamily: 'lexend',
    ),
  ),
);
