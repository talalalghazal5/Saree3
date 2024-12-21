import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saree3/constants.dart';
import 'package:saree3/view/components/auth/auth_text_field.dart';
import 'package:saree3/view/components/misc/primary_button.dart';
import 'package:saree3/view/pages/sign_in_page.dart';

class SignUpPage extends StatelessWidget{
  const SignUpPage({super.key});

  static String id = 'SignUpPage';
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
                  'Sign Up',
                  style: TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: 32,
                    color: Colors.black
                  ),
                ),
              ],
            ),
            const SizedBox(
                  height: 40,
                ),
            
            AuthTextField(hint: 'Full Name'), 
            const SizedBox(
              height: 10,
            ),
            AuthTextField(hint: 'Phone Number'), 
            const SizedBox(
              height: 10,
            ),
            AuthTextField(hint: 'Password'), 
            const SizedBox(
              height: 10,
            ),
            AuthTextField(hint: 'Confirm Password'), 
            const SizedBox(
              height: 30,
            ),
            // GestureDetector(
            //       onTap: (){
            //         Navigator.pushNamed(context, ChatPage.id);
            //       },),
            PrimaryButton(text: 'Sign Up',
            font: 'Lexend',),
            const SizedBox(height: 30,),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                const Text('Already have an account ?  ',
                style: TextStyle(
                  color: Colors.black,
                ),),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, SignInPage.id);
                  },
                  child: const Text(' Sign In',
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