import 'package:flutter/material.dart';
import 'package:saree3/UI/components/homePageComponents/shoppingCartComponents/productSelector/quantity_selector_button.dart';
import 'package:saree3/data/models/product_model.dart';

class ProductsSelectorCard extends StatelessWidget {
  ProductsSelectorCard({super.key, required this.productSelector});
  ProductModel productSelector;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 150,
        width: 450,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xffE6E6E8),
        ),
        child: Card(
          clipBehavior: Clip.none,
          color: const Color(0xffE6E6E8),
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
                    child: Image.asset(productSelector.image),
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
                        Text(productSelector.name),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            color: const Color(0xffB5A9F5),
                            child: Text(productSelector.categoryName)),
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
