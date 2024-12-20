import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saree3_application/constants.dart';
import 'package:saree3_application/pages/sign_in_page.dart';
import 'package:saree3_application/widgets/custom_button.dart';
import 'package:saree3_application/widgets/custom_text_field.dart';

class SignUpPage extends StatelessWidget{
  SignUpPage({Key? key}) : super(key: key);

  static String id = 'SignUpPage';
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
                const SizedBox(
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
            SizedBox(
                  height: 40,
                ),
            
            CustomTextField(hint: 'Full Name'), 
            const SizedBox(
              height: 10,
            ),
            CustomTextField(hint: 'Phone Number'), 
            const SizedBox(
              height: 10,
            ),
            CustomTextField(hint: 'Password'), 
            const SizedBox(
              height: 10,
            ),
            CustomTextField(hint: 'Confirm Password'), 
            const SizedBox(
              height: 30,
            ),
            // GestureDetector(
            //       onTap: (){
            //         Navigator.pushNamed(context, ChatPage.id);
            //       },),
            CustomButton(text: 'Sign Up',
            font: 'Lexend',),
            SizedBox(height: 30,),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Text('Already have an account ?  ',
                style: TextStyle(
                  color: Colors.black,
                ),),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, SignInPage.id);
                  },
                  child: Text(' Sign In',
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