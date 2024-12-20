import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saree3_application/constants.dart';
import 'package:saree3_application/pages/otp.dart';
import 'package:saree3_application/pages/sign_up_page.dart';
import 'package:saree3_application/widgets/custom_button.dart';
import 'package:saree3_application/widgets/custom_text_field.dart';

class SignInPage extends StatelessWidget{
  SignInPage({Key? key}) : super(key: key);
  static String id = 'SignInPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSurface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 100,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.truckFast , 
                size: 110,),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Sign In',
                  style: TextStyle(
                    fontFamily: 'Lexend-',
                    fontWeight: FontWeight.w400,
                    fontSize: 32,
                    color: Colors.black
                  ),
                ),
              ],
            ),

            SizedBox(
                  height: 40,
                ),
            
            CustomTextField(hint: 'Phone Number'), 
            const SizedBox(
              height: 10,
            ),
            CustomTextField(hint: 'Password'), 
            const SizedBox(
              height: 10,
            ),
            Text(
              'Forgot Password?',
              style: TextStyle(
                color: kSecondary
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(text: 'Sign In',
            font: 'Lexend',),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                
                Text('Don\'t have an account ?  ',
                style: TextStyle(
                  color: Colors.black,
                ),),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context,SignUpPage.id);
                  },
                  child: Text(' Sign Up',
                  style: TextStyle(
                    color: kSecondary,
                  ),),
                ),
              ],
            ),
            Spacer(flex: 3,)
          ],
        ),
      ),
    );
    
  }
}