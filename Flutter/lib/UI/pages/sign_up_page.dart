import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saree3/UI/components/auth/otp/auth_text_field.dart';
import 'package:saree3/UI/components/misc/primary_button.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  SignUpPage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
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
            Form(
              key: formKey,
              child: Column(
                children: [
                  AuthTextField(
                    controller: _nameController,
                    hint: 'Full Name',
                    textInputType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthTextField(
                    textInputType: TextInputType.phone,
                    controller: _phoneController,
                    hint: 'Phone Number',
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
                        return 'Please enter a password';
                      } else if (value.length < 8) {
                        return 'Your password should be at least 8 characters long';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthTextField(
                    controller: _confirmPasswordController,
                    hint: 'Confirm Password',
                    textInputType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (_passwordController.text != value) {
                        return 'Passwords do not match';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  PrimaryButton(
                    text: 'Sign Up',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, '/otpPage');
                      }
                    },
                  ),
                ],
              ),
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
    );
  }
}
