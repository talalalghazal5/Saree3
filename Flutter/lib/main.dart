import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saree3/UI/pages/home_page.dart';
import 'package:saree3/UI/pages/onboarding/onboarding_page.dart';
import 'package:saree3/UI/pages/onboarding/page_four.dart';
import 'package:saree3/UI/pages/onboarding/page_one.dart';
import 'package:saree3/UI/pages/onboarding/page_three.dart';
import 'package:saree3/UI/pages/onboarding/page_two.dart';
import 'package:saree3/UI/pages/otp.dart';
import 'package:saree3/UI/pages/sign_in_page.dart';
import 'package:saree3/UI/pages/sign_up_page.dart';
import 'package:saree3/UI/themes/theme_provider.dart';
import 'package:saree3/controllers/onboarding_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences preferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  preferences = await SharedPreferences.getInstance();
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
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => const OnboardingPage(),
        '/firstpage': (context) => const PageOne(),
        '/secondpage': (context) => const PageTwo(),
        '/thirdpage': (context) => const PageThree(),
        '/fourthpage': (context) => const PageFour(),
        '/loginPage': (context) =>  SignInPage(),
        '/signupPage': (context) => SignUpPage(),
        '/otpPage': (context) => Otp(),
        '/homepage': (context) =>const HomePage(),
      },
    );
  }
}
