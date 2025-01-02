import 'package:flutter/material.dart';
import 'package:saree3/UI/components/homePageComponents/shoppingCartComponents/productSelector/product_selector_card.dart';
import 'package:saree3/UI/components/misc/primary_button.dart';
import 'package:saree3/data/models/product_model.dart';

class ShoppingCart extends StatelessWidget {
  ShoppingCart({super.key});
  final List<ProductModel> selectProducts = List.generate(
    10,
    (index) => ProductModel(
        name: "title",
        price: index * 10,
        image: '',
        id: 0,
        description: 'hi',
        categoryName: 'laptop'),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('My Cart'),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content:
                            PrimaryButton(onPressed: () {}, text: 'Clear Cart'),
                      );
                    },
                  );
                },
                icon: const Icon(Icons.more_horiz),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: selectProducts.length,
              itemBuilder: (context, index) {
                return ProductsSelectorCard(
                  productSelector: selectProducts[index],
                );
              },
            ),
          ),
          const SizedBox(
            height: 50,
            child: Center(
              child: Text('Total Cost:' r'$'),
            ),
          ),
          PrimaryButton(onPressed: (){}, text: 'Checkout'),
        ],
      ),
    );
  }
}
