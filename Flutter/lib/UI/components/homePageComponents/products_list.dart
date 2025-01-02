import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categoryName,
                style:
                    Theme.of(context).textTheme.headlineSmall
              ),
              InkWell(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'show more',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Theme.of(context).colorScheme.tertiary, fontWeight: FontWeight.w400)
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    FaIcon(
                      FontAwesomeIcons.chevronRight,
                      size: 14,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          const Expanded(
            child: Placeholder(),
            //TODO: Add the products.
          )
        ],
      ),
    );
  }
}
