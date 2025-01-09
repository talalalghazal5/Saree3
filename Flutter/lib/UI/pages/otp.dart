import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saree3/UI/components/auth/otp/otp_text_field.dart';
import 'package:saree3/UI/components/misc/primary_button.dart';
import 'package:saree3/services/auth_services.dart';

class Otp extends StatefulWidget {
  Otp({super.key, this.phoneNumber});
  static String id = 'Otp';
  static String otp = 'Otp';
  String? phoneNumber;

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView(
            children: [
              const SizedBox(
                height: 90,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(height: 70),
                  const Text(
                    'Verify that it\'s you',
                    style: TextStyle(
                        fontFamily: 'lexend',
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  FaIcon(
                    FontAwesomeIcons.unlock,
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
                    height: 70,
                  ),
                  Text('Enter the 4 digit code we just sent you',
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(
                    height: 20,
                  ),
                  Otptextfield(onChanged: (value) {
                    Otp.otp = value;
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Didn\'t get code? ',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'resend it',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                                decoration: TextDecoration.underline,
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  _isLoading
                      ? const CircularProgressIndicator()
                      : PrimaryButton(
                          text: 'Verify Now',
                          onPressed: () async {
                            try {
                              if (Otp.otp == 'Otp') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Please enter the verification code',
                                    ),
                                  ),
                                );
                              } else {
                                setState(() {
                                  _isLoading = true;
                                });
                                var verificationData =
                                    await AuthServices().verify(
                                  verification_code: Otp.otp,
                                  phone_number: widget.phoneNumber!,
                                );

                                if (verificationData != {}) {
                                  ScaffoldMessenger.of(
                                          context.mounted ? context : context)
                                      .showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        '${verificationData['message']}, sign in now',
                                      ),
                                    ),
                                  );
                                }
                                if (verificationData['statusCode'] == 200) {
                                  Navigator.popAndPushNamed(
                                    context.mounted ? context : context,
                                    '/loginPage',
                                  );
                                }
                              }
                            } finally {
                              setState(() {
                                _isLoading = false;
                              });
                            }
                          },
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
