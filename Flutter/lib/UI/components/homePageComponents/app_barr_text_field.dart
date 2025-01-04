import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarrTextField extends StatelessWidget {
  const AppBarrTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).colorScheme.onSurface,
      decoration: InputDecoration(
        suffix: FaIcon(
          FontAwesomeIcons.magnifyingGlass,
          color: Theme.of(context).colorScheme.inverseSurface,
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.inverseSurface.withAlpha(100),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 10,
        ),
        hintText: 'Search for products, vendors..',
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withAlpha(200)),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
