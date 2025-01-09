import 'package:flutter/material.dart';
import 'package:saree3/UI/pages/home_page.dart';
import 'package:saree3/UI/pages/sign_in_page.dart';
import 'package:saree3/UI/pages/sign_up_page.dart';
import 'package:saree3/main.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (preferences.getString('userToken') == '') {
      if (showLoginPage) {
        return SignInPage(
          onTap: togglePages,
        );
      } else {
        return SignUpPage(
          onTap: togglePages,
        );
      }
    }
    print(preferences.getString('userToken'));
    return const HomePage();
  }
}
