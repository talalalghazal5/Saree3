import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saree3/data/models/product.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;
  final Product product;

  const QuantitySelector(
      {super.key, required this.quantity,
      required this.onDecrement,
      required this.onIncrement,
      required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          InkWell(
            onTap:onDecrement,
            child: Icon(CupertinoIcons.minus, color: Theme.of(context).colorScheme.inversePrimary,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              width: 20,
              child: Center(
                child: Text(quantity.toString(), style: const TextStyle(fontFamily: 'sf_pro_display_regular'),),
              ),
            ),
          ),
          InkWell(
            onTap: onIncrement,
            child: Icon(CupertinoIcons.add, color: Theme.of(context).colorScheme.inversePrimary,),
          ),
        ],
      ),
    );
  }
}
