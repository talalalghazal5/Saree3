import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saree3/constants.dart';
import 'package:saree3/UI/components/auth/otp/auth_text_field.dart';
import 'package:saree3/UI/components/misc/primary_button.dart';
import 'package:saree3/UI/pages/sign_up_page.dart';


class SignInPage extends StatelessWidget{
  const SignInPage({super.key});
  static String id = 'SignInPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSurface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.truckFast , 
                size: 110,
                color: Color.fromARGB(255, 49, 49, 49),
                    shadows: [
                      Shadow(color: Color.fromARGB(64, 0, 0, 0),
                      offset: Offset(0, 10),
                      blurRadius: 10)
                    ],),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Sign In',
                  style: TextStyle(
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w400,
                    fontSize: 32,
                    color: Colors.black
                  ),
                ),
              ],
            ),

            const SizedBox(
                  height: 40,
                ),
            
            AuthTextField(hint: 'Phone Number'), 
            const SizedBox(
              height: 10,
            ),
            AuthTextField(hint: 'Password'), 
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Forgot Password?',
              style: TextStyle(
                color: kSecondary
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            PrimaryButton(text: 'Sign In',
            font: 'Lexend',),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                
                const Text('Don\'t have an account ?  ',
                style: TextStyle(
                  color: Colors.black,
                ),),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context,SignUpPage.id);
                  },
                  child: const Text(' Sign Up',
                  style: TextStyle(
                    color: kSecondary,
                  ),),
                ),
              ],
            ),
            const Spacer(flex: 3,)
          ],
        ),
      ),
    );
    
  }
}