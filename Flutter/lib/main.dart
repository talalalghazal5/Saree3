import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saree3/UI/pages/onboarding/page_four.dart';
import 'package:saree3/UI/pages/onboarding/page_one.dart';
import 'package:saree3/UI/pages/onboarding/page_three.dart';
import 'package:saree3/UI/pages/onboarding/page_two.dart';
import 'package:saree3/UI/themes/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
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
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      initialRoute: '/fourthpage',
      routes: {
        '/firstpage' : (context) => const PageOne(),
        '/secondpage' : (context) => const PageTwo(),
        '/thirdpage' : (context) => const PageThree(),
        '/fourthpage' : (context) => const PageFour(),
      },
    );
  }
}
