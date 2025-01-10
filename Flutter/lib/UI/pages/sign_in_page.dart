import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saree3/UI/components/auth/otp/auth_text_field.dart';
import 'package:saree3/UI/components/misc/primary_button.dart';
import 'package:saree3/UI/pages/home_page.dart';
import 'package:saree3/services/auth_services.dart';

class SignInPage extends StatefulWidget {
  final void Function()? onTap;

  const SignInPage({super.key, this.onTap});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Column(
              children: [
                FaIcon(
                  FontAwesomeIcons.truckFast,
                  size: 110,
                  color: Theme.of(context).colorScheme.onSurface,
                  shadows: [
                    Shadow(
                      color: Theme.of(context).colorScheme.inverseSurface,
                      offset: const Offset(0, 10),
                      blurRadius: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthTextField(
                    textInputType: TextInputType.phone,
                    controller: _phoneController,
                    hint: 'Phone Number',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthTextField(
                    controller: _passwordController,
                    hint: 'Password',
                    textInputType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Forgot Password?',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            decoration: TextDecoration.underline,
                            decorationColor:
                                Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            _isLoading
                ? const CircularProgressIndicator()
                : PrimaryButton(
                    onPressed: () async {
                      try {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });
                          print('validated ======');
                          var signInData = await AuthServices().signIn(
                            phone_number: _phoneController.text,
                            password: _passwordController.text,
                          );

                          if (signInData != {}) {
                            ScaffoldMessenger.of(
                                    context.mounted ? context : context)
                                .showSnackBar(
                              SnackBar(
                                elevation: 0,
                                backgroundColor: signInData['statusCode'] != 200 ? Theme.of(context).colorScheme.error.withAlpha(200) : Theme.of(context).colorScheme.inverseSurface,
                                content: Text(
                                  signInData['statusCode'] == 404
                                      ? signInData['persistentConnection'] == false
                                          ? signInData['message']
                                          : 'Account not found, please try registering or logging in with existing account'
                                      : signInData['statusCode'] == 403
                                          ? 'Incorrect phone number or password, try again'
                                          : signInData['message'],
                                ),
                              ),
                            );
                            if (signInData['statusCode'] == 200) {
                              Navigator.pushReplacement(
                                  context.mounted ? context : context,
                                  CupertinoPageRoute(
                                    builder: (context) => const HomePage(),
                                  ));
                            }
                          }
                        }
                      } finally {
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
                    text: 'Sign In',
                  ),
            const SizedBox(
              height: 27,
            ),
            Row(
              children: [
                Text(
                  'Don\'t have an account? ',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Sign up',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
