import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saree3_application/constants.dart';
import 'package:saree3_application/widgets/custom_button.dart';
import 'package:saree3_application/widgets/otpTextField.dart';

class Otp extends StatelessWidget {
  Otp({Key? key}) : super(key: key);
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
              SizedBox(
                height: 90,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(height: 70),
                  Text(
                    'Verify that it\'s you',
                    style: TextStyle(
                        fontFamily: 'Lexend-',
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  FaIcon(
                    FontAwesomeIcons.unlock,
                    size: 110,
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Enter the 4 digit code we just sent to you',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Otptextfield(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
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
                  SizedBox(
                    height: 60,
                  ),
                  CustomButton(text: 'Verify Now', font: 'Lexend'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
