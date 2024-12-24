import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saree3/UI/components/auth/otp/auth_text_field.dart';
import 'package:saree3/UI/components/misc/primary_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    height: 40,
                  ),
                  Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const AuthTextField(hint: 'Full Name'),
              const SizedBox(
                height: 15,
              ),
              const AuthTextField(hint: 'Phone Number', textInputType: TextInputType.phone,),
              const SizedBox(
                height: 15,
              ),
              const AuthTextField(hint: 'Password', textInputType: TextInputType.visiblePassword,),
              const SizedBox(
                height: 15,
              ),
              const AuthTextField(hint: 'Confirm Password', textInputType: TextInputType.visiblePassword,),
              const SizedBox(
                height: 30,
              ),
              PrimaryButton(
                text: 'Sign Up',
                onPressed: () {},
              ),
              const SizedBox(
                height: 17,
              ),
              Row(
                children: [
                  Text(
                    'Already have an account? ',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/loginPage');
                    },
                    child: Text(
                      'Sign In',
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
