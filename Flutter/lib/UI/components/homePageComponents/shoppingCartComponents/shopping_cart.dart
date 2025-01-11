import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saree3/UI/components/homePageComponents/shoppingCartComponents/productSelector/product_selector_card.dart';
import 'package:saree3/UI/components/misc/primary_button.dart';
import 'package:saree3/controllers/cart_provider.dart';
import 'package:saree3/data/models/cart_item.dart';
import 'package:saree3/services/order_service.dart';

class ShoppingCart extends StatelessWidget {
  ShoppingCart({super.key});
  final OrderService orderService = OrderService();
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('My Cart'),
              IconButton(
                onPressed: () {
                  const DropdownMenu(
                    dropdownMenuEntries: [
                      DropdownMenuEntry(value: 'clear', label: 'Clear cart')
                    ],
                  );
                },
                icon: const Icon(Icons.more_horiz),
              )
            ],
          ),
          if (cartProvider.cart.isEmpty)
            Align(
              alignment: Alignment.center,
              child: Text(
                'No products ordered',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.inverseSurface,
                    ),
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.cart.length,
              itemBuilder: (context, index) {
                CartItem cartItem = cartProvider.cart[index];
                return ProductsSelectorCard(cartItem: cartItem);
              },
            ),
          ),
          SizedBox(
            height: 50,
            child: Center(
              child: Text('Total Cost: \$${cartProvider.totalCartCost}'),
            ),
          ),
          PrimaryButton(
            onPressed: () {
              orderService.placeNewOrder(cartProvider.cart);
            },
            text: 'Checkout',
          ),
        ],
      ),
    );
  }
}
