import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      TextButton(
        onPressed: () => query = '',
        child: Text(
          'Clear',
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
      ),
    ];
  }


  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: FaIcon(
        FontAwesomeIcons.chevronLeft,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return IconButton(onPressed: () {}, icon: const Icon(Icons.cancel));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_left));
  }
}
