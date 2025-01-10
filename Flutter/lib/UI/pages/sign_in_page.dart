import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saree3/UI/components/auth/otp/auth_text_field.dart';
import 'package:saree3/UI/components/misc/primary_button.dart';
import 'package:validate_phone_number/validate_phone_number.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ValidatePhoneNumber(
                    label: const Text('Phone Number'),
                    labelStyle: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      fontWeight: FontWeight.w300,
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.inverseSurface),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error),
                    ),
                    controller: _phoneController,
                    onCountrySelected: (phoneCode, countryCode) {
                      print(
                        'Country selected: $countryCode, Phone code: $phoneCode',
                      );
                    },
                    onTapOutside: (value) => FocusScope.of(context).unfocus(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthTextField(
                    controller: _passwordController,
                    hint: 'Password',
                    textInputType: TextInputType.visiblePassword,
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
    );
  }
}
