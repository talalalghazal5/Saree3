import 'package:flutter/material.dart';
import 'package:saree3/constants.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({super.key, required this.text , required this.font});
  String? text;
  String? font;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: 60,
      child: Center(
        child: Text(text!, style: TextStyle(
          color: Colors.white,
          fontFamily: font,
        ),),
      ),
    );
  }
}
