import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saree3/data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 250,
      margin: const EdgeInsets.only(right: 15),
      child: Card(
        color: Theme.of(context).colorScheme.inverseSurface.withAlpha(50),
        margin: const EdgeInsets.all(0),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: Stack(
                children: [
                  Image.network(
                    'https://placehold.co/600x400.png',
                    height: 150.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const FaIcon(FontAwesomeIcons.heart, color: Colors.red),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name,
                style: Theme.of(context).textTheme.bodyLarge
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '\$${product.price}',
                style: Theme.of(context).textTheme.labelMedium,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
