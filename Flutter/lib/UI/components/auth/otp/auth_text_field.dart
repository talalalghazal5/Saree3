import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    this.hint = '',
    required this.textInputType,
    required this.controller,
    this.validator,
  });
  final String hint;
  final TextInputType textInputType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool isObscure = true;
  late final bool isPasswordField;

  @override
  void initState() {
    super.initState();
    isPasswordField =
        widget.textInputType == TextInputType.visiblePassword ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofocus: false,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      keyboardType: widget.textInputType,
      obscureText: isPasswordField ? isObscure : false,
      onSaved: (newValue) => widget.controller.text = newValue!,
      onChanged: (value) => widget.controller.text = value,
      decoration: InputDecoration(
        label: Text(widget.hint),
        labelStyle: TextStyle(
          fontSize: 15,
          color: Theme.of(context).colorScheme.surfaceContainer,
          fontWeight: FontWeight.w300,
        ),
        suffix: isPasswordField
            ? InkWell(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: FaIcon(
                  isObscure ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
                ),
              )
            : null,
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        floatingLabelStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
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
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.errorContainer,
          ),
        ),
      ),
      validator: widget.validator,
    );
  }
}
