import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saree3/UI/components/homePageComponents/shoppingCartComponents/productSelector/quantity_selector_button.dart';
import 'package:saree3/controllers/cart_provider.dart';
import 'package:saree3/data/models/cart_item.dart';

class ProductsSelectorCard extends StatelessWidget {
  ProductsSelectorCard({super.key, required this.cartItem});
  CartItem cartItem;
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 200,
        width: 450,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Card(
          elevation: 0,
          color: Theme.of(context).colorScheme.inverseSurface.withAlpha(50),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 134,
                  width: 125,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Center(
                    child: Text(
                      'This is a placeholder',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                    height: 134,
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cartItem.product.name!),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(cartItem.product.categoryName!),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text('total:'),
                        Text(
                          r'$' '${cartItem.totalCost.toString()}',
                          style: const TextStyle(color: Color(0xff240CAA)),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 134,
                  width: 70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            cartProvider.removeFromCart(cartItem);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                      const QuantitySelectorButton()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
