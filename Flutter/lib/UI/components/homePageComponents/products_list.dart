import 'package:flutter/material.dart';
import 'package:saree3/UI/components/homePageComponents/product_card.dart';
import 'package:saree3/data/models/product.dart';

class ProductsList extends StatelessWidget {
  ProductsList({super.key, required this.products});
  List<Product> products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
