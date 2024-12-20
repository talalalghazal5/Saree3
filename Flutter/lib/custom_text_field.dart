import 'package:flutter/material.dart';
import 'package:saree3_application/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField ({this.hint});
  String? hint;
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text(hint!,
        style: TextStyle(
          color: kInverseTertiary
        ),),
        hintText: hint,
        hintStyle: TextStyle(
          color: kInverseSecondary,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kInverseTertiary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kInverseTertiary,
          ),
        )
      ),
    );  
    
  }
}