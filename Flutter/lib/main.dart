import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saree3/UI/pages/home_page.dart';
import 'package:saree3/UI/pages/info_editing.dart';
import 'package:saree3/UI/pages/login_or_register.dart';
import 'package:saree3/UI/pages/onboarding/onboarding_page.dart';
import 'package:saree3/UI/pages/order_history.dart';
import 'package:saree3/UI/pages/otp.dart';
import 'package:saree3/UI/pages/payment_page.dart';
import 'package:saree3/UI/pages/settings_page.dart';
import 'package:saree3/UI/pages/sign_in_page.dart';
import 'package:saree3/UI/pages/sign_up_page.dart';
import 'package:saree3/UI/pages/signin_check.dart';
import 'package:saree3/UI/themes/theme_provider.dart';
import 'package:saree3/controllers/cart_provider.dart';
import 'package:saree3/controllers/category_provider.dart';
import 'package:saree3/controllers/image_controller.dart';
import 'package:saree3/controllers/onboarding_controller.dart';
import 'package:saree3/controllers/user_controller.dart';
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
        ChangeNotifierProvider(create: (context) => OnboardingController()),
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider(create: (context) => CartProvider(),),
        ChangeNotifierProvider(create: (context) => ImageController(),),
        ChangeNotifierProvider(create: (context) => UserController(),)
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
      initialRoute: preferences.getBool('isSkipped') == null ? '/onboarding' : preferences.getBool('isSkipped')! ?'/loginOrRegister'  : '/onboarding',
      routes: {
        '/onboarding': (context) => const OnboardingPage(),
        '/loginPage': (context) => const SignInPage(),
        '/signupPage': (context) => const SignUpPage(),
        '/otpPage': (context) => Otp(),
        '/homePage': (context) => const HomePage(),
        '/settingsPage': (context) => const SettingsPage(),
        '/infoEditingPage': (context) => const InfoEditing(),
        '/signinCheck' : (context) => const SigninCheck(),
        '/loginOrRegister' : (context) => const LoginOrRegister(),
        // '/orderDetails' : (context) => const OrderDetails(),
        '/orderHistory' : (context) => const OrderHistory(),
        '/paymentPage' : (context) => PaymentPage(),
      },
    );
  }
}
