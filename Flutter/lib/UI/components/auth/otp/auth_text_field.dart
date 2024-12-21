import 'package:flutter/material.dart';
import 'package:saree3/constants.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({super.key, this.hint});
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text(
          hint!,
          style: const TextStyle(color: kInverseTertiary),
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          color: kInverseSecondary,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kInverseTertiary,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kInverseTertiary,
          ),
        ),
      ),
    );
  }
}