import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saree3/UI/components/auth/otp/auth_text_field.dart';
import 'package:saree3/UI/components/misc/primary_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthTextField(
                    hint: 'Phone Number',
                    textInputType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const AuthTextField(
                    hint: 'Password',
                    textInputType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
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
              const SizedBox(
                height: 40,
              ),
              PrimaryButton(
                onPressed: () {},
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
                    onTap: () {
                      Navigator.pushNamed(context, '/signupPage');
                    },
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
      ),
    );
  }
}
