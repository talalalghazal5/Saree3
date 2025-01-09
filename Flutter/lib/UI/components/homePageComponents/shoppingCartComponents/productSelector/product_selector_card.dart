import 'package:flutter/material.dart';
import 'package:saree3/UI/components/homePageComponents/shoppingCartComponents/productSelector/quantity_selector_button.dart';
import 'package:saree3/data/models/product.dart';

class ProductsSelectorCard extends StatelessWidget {
  ProductsSelectorCard({super.key, required this.productSelector});
  Product productSelector;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 150,
        width: 450,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Card(
          color: Theme.of(context).colorScheme.inverseSurface.withAlpha(100),
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
                    child:  Text('This is a placeholder', style: Theme.of(context).textTheme.labelSmall,),
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
                        Text(productSelector.name!),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(productSelector.categoryName!),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text('total:'),
                        Text(
                          r'$' '${productSelector.price.toString()}',
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
                          onPressed: () {},
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
