import 'package:flutter/material.dart';
import 'package:saree3/data/models/product_model.dart';
import 'package:saree3/ui/components/custom_button.dart';
import 'package:saree3/ui/components/homePageComponents/shoppingCartComponents/productSelector/product_selector_card.dart';

class ShoppingCart extends StatelessWidget {
  ShoppingCart({super.key});
  final List<ProductModel> selectProducts = List.generate(
    10,
    (index) => ProductModel(
        name: "title",
        price: index * 10,
        image: 'lib/images/laptop.jpg',
        id: 0,
        description: 'hi',
        categoryName: 'laptop'),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 800,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('My Cart'),
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: CustomButton(
                                width: 100, buttonName: 'Clean'),
                          );
                        });
                  },
                  icon: Icon(Icons.more_horiz))
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
          Container(
            height: 50,
            child: const Center(
              child: Text('Total Cost:' r'$'),
            ),
          ),
          CustomButton(width: double.infinity, buttonName: 'Check Out'),
        ],
      ),
    );
  }
}
