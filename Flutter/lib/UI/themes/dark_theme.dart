import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
    surface: Color(0xff25242b),
    onSurface: Color(0xffFFFFF7),
    surfaceContainer: Color(0xff626165),
    primary: Color.fromARGB(255, 77, 48, 241),
    onPrimary: Color(0xffFFFFF7),
    secondary: Color(0xff240CAA),
    onSecondary: Color(0xffFFFFF7),
    tertiary: Color(0xffFF7F50),
    error: Color(0xffDE2C2C),
    errorContainer: Color(0xffB71212),
    onError: Color(0xffFFFFF7),
    inverseSurface: Color(0xffB2B1B6),
  ),
  textTheme: const TextTheme(
// =========== H E A D L I N E =========
    headlineLarge: TextStyle(
      fontSize: 27,
      fontWeight: FontWeight.w600,
      color: Color(0xffFFFFF7),
      fontFamily: 'lexend',
      fontFamilyFallback: ['sfArabic'],
    ),
    headlineMedium: TextStyle(
      fontSize: 23,
      color: Color(0xffFFFFF7),
      fontFamily: 'lexend',
      fontFamilyFallback: ['sfArabic'],
    ),
    headlineSmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Color(0xffFFFFF7),
      fontFamily: 'lexend',
      fontFamilyFallback: ['sfArabic'],
    ),
// =========== B O D Y =================
    bodyLarge: TextStyle(
      fontSize: 18,
      color: Color(0xffFFFFF7),
      fontFamily: 'lexend',
      fontFamilyFallback: ['sfArabic'],
    ),
    bodyMedium: TextStyle(
      fontSize: 15,
      color: Color(0xffFFFFF7),
      fontFamily: 'lexend',
      fontFamilyFallback: ['sfArabic'],
    ),
    bodySmall: TextStyle(
      fontSize: 13,
      color: Color(0xffFFFFF7),
      fontFamily: 'lexend',
      fontFamilyFallback: ['sfArabic'],
    ),
// =========== L A B E L S ===============
    labelMedium: TextStyle(
      fontSize: 15,
      color: Color(0xffFF7F50),
      fontFamily: 'lexend',
      fontFamilyFallback: ['sfArabic'],
    ),

    //this is for primary button.
    labelSmall: TextStyle(
      color: Color(0xffFFFFF7),
      fontSize: 14,
      fontFamily: 'lexend',
      fontFamilyFallback: ['sfArabic'],
    ),
  ),
);
