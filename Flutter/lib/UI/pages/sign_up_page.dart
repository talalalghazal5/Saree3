import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saree3/UI/components/auth/otp/auth_text_field.dart';
import 'package:saree3/UI/components/misc/primary_button.dart';
import 'package:validate_phone_number/validate_phone_number.dart';
import 'package:saree3/UI/pages/otp.dart';
import 'package:saree3/services/auth_services.dart';

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
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
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
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.error,
                      ),
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
                        AuthServices().register(
                            name: _nameController.text,
                            phone_number: _phoneController.text,
                            password: _passwordController.text,
                            password_confirmation:
                                _confirmPasswordController.text);

                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Otp(phoneNumber: _phoneController.text,);
                        }
                        ));
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
