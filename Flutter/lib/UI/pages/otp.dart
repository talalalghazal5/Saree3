import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saree3/constants.dart';
import 'package:saree3/UI/components/auth/otp/otp_text_field.dart';
import 'package:saree3/UI/components/misc/primary_button.dart';

class Otp extends StatelessWidget {
  const Otp({super.key});
  static String id = 'Otp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSurface,
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
                  const FaIcon(
                    FontAwesomeIcons.unlock,
                    size: 110,
                    color: Color.fromARGB(255, 49, 49, 49),
                    shadows: [
                      Shadow(color: Color.fromARGB(64, 0, 0, 0),
                      offset: Offset(0, 10),
                      blurRadius: 10)
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  const Text(
                    'Enter the 4 digit code we just sent to you',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Otptextfield(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Didn\'t get code? '),
                      Text(
                        'resend it',
                        style: TextStyle(
                          color: kSecondary,
                          decoration: TextDecoration.underline,
                          
                          decorationColor: kSecondary,
                          decorationThickness: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  PrimaryButton(text: 'Verify Now', font: 'Lexend'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
