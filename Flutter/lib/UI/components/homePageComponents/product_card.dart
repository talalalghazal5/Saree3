import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saree3/data/models/product_model.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.width, required this.product});
  double width;

  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(0),
      child: Card(
        elevation: 0,
        clipBehavior: Clip.hardEdge,
        color: Colors.grey,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(color: Colors.indigo),
              child: SvgPicture.asset(
                'assets/images/svgs/safe_payment.svg',
                fit: BoxFit.cover,
                width: 150,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product.price}',
                      style: const TextStyle(color: Colors.amber),
                    ),
                    IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.heart,))
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
