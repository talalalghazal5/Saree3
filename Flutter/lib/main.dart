import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saree3/UI/pages/home_page.dart';
import 'package:saree3/UI/pages/onboarding/onboarding_page.dart';
import 'package:saree3/UI/pages/otp.dart';
import 'package:saree3/UI/pages/sign_in_page.dart';
import 'package:saree3/UI/pages/sign_up_page.dart';
import 'package:saree3/UI/themes/theme_provider.dart';
import 'package:saree3/controllers/onboarding_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(create: (context) => OnboardingController())
      ],
      child: const MyApp(),
    ),
  );
}

// This is where the app starts.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saree3',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      initialRoute: '/homePage',
      routes: {
        '/onboarding': (context) => const OnboardingPage(),
        '/loginPage': (context) => const SignInPage(),
        '/signupPage': (context) => const SignUpPage(),
        '/otpPage': (context) => const Otp(),
        '/homePage': (context) => const HomePage(),
      },
    );
  }
}
