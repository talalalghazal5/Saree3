import 'package:flutter/material.dart';
import 'package:saree3/data/models/product_model.dart';
import 'package:saree3/ui/components/homePageComponents/product_card.dart';
import 'package:saree3/ui/pages/product_detail_page.dart';

class ProdectsList extends StatelessWidget {
  ProdectsList({super.key});
  final List<ProductModel> products = List.generate(
      10,
      (index) => ProductModel(
          name: "title",
          price: index * 10,
          image: 'lib/images/laptop.jpg',
          id: 0,
          description:
              'this is some description about this product and how it would apper',
          categoryName: 'laptop'));
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailPage(productModel: products[index]),
                ),
              );
            },
            child: CustomCard(product: products[index], width: 175),
          );
        },
      ),
    );
  }
}
