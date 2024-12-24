import 'package:flutter/material.dart';

class PrimaryButton extends MaterialButton {
  final String text;
  const PrimaryButton({
    super.key,
    required super.onPressed,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 500,
      height: 55,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      onPressed: onPressed,
      color: Theme.of(context).colorScheme.primary,
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}
