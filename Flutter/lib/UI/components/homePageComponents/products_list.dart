import 'package:flutter/material.dart';
import 'package:saree3/UI/components/homePageComponents/product_card.dart';
import 'package:saree3/UI/pages/product_detail_page.dart';
import 'package:saree3/data/models/product_model.dart';

class ProductsList extends StatelessWidget {
  ProductsList({super.key, required this.categoryName});

  final String categoryName;

  final List<ProductModel> products = List.generate(
    10,
    (index) => ProductModel(
      name: "title",
      price: index * 10,
      image: 'https://placehold.co/50x50.png',
      id: 0,
      description:
          'this is some description about this product and how it would apper',
      categoryName: 'Laptop',
    ),
  );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categoryName,
                style: const TextStyle(
                  fontFamily: 'lexend',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'show more',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Color(0xff240CAA),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
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
                        builder: (context) => ProductDetailPage(
                          productModel: products[index],
                        ),
                      ),
                    );
                  },
                  child: CustomCard(product: products[index], width: 175),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
