import 'package:flutter/material.dart';
import 'package:saree3/UI/components/homePageComponents/shoppingCartComponents/productSelector/product_selector_card.dart';
import 'package:saree3/UI/components/misc/primary_button.dart';
import 'package:saree3/data/models/product.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});
  
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
          const Expanded(
            child: Center(),
            //Todo: Add the cart items to this widget.
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
