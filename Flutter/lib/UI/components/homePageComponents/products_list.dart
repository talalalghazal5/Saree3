import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saree3/UI/components/homePageComponents/product_card.dart';
import 'package:saree3/data/models/product_model.dart';

class ProductsList extends StatelessWidget {
  ProductsList({super.key, required this.categoryName});
  final String categoryName;
  List<ProductModel> products = List.generate(
    10,
    (index) => ProductModel(
      id: 2,
      categoryName: 'laptop',
      name: 'laptop',
      image: 'image',
      price: 9.99,
      description: 'l;kasdf wf',
    ),
  );
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
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: products[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
