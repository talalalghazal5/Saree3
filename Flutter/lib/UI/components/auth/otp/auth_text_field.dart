import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({super.key, this.hint = '', this.textInputType = TextInputType.text});
  final String hint;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      decoration: InputDecoration(
        label: Text(hint),
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        labelStyle: TextStyle(
          fontSize: 15,
          color: Theme.of(context).colorScheme.surfaceContainer,
          fontWeight: FontWeight.w300,
        ),
        floatingLabelStyle:
            TextStyle(color: Theme.of(context).colorScheme.primary),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.errorContainer,
          ),
        ),
      ),
    );
  }
}
