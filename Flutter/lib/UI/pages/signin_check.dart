import 'package:flutter/material.dart';
import 'package:saree3/main.dart';

class SigninCheck extends StatelessWidget {
  const SigninCheck({super.key});

  @override
  Widget build(BuildContext context) {
    String token = preferences.getString('userToken') ?? 'no token';
    return Scaffold(
      body: Center(
        child: Text('sign in done, Token: $token'),
      ),
    );
  }
}