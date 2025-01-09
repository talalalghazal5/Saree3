import 'package:flutter/material.dart';
import 'package:saree3/UI/components/misc/primary_button.dart';

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
                  const DropdownMenu(dropdownMenuEntries: [DropdownMenuEntry(value: 'clear', label: 'Clear cart')], );
                },
                icon: const Icon(Icons.more_horiz),
              )
            ],
          ),
          const Column(
            
          ),
          const SizedBox(
            height: 50,
            child: Center(
              child: Text('Total Cost:' r'$'),
            ),
          ),
          PrimaryButton(onPressed: () {}, text: 'Checkout'),
        ],
      ),
    );
  }
}
