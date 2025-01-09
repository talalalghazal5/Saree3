import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saree3/UI/components/homePageComponents/my_search_delegate.dart';

class AppBarTextField extends StatelessWidget {
  const AppBarTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.inverseSurface.withAlpha(40))
      ),
        onPressed: () =>
            showSearch(context: context, delegate: MySearchDelegate()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Search', style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Theme.of(context).colorScheme.inverseSurface,),),
            const SizedBox(width: 15,),
            FaIcon(FontAwesomeIcons.magnifyingGlass, size: 20, color: Theme.of(context).colorScheme.surfaceContainer),
          ],
        ));
  }
}
