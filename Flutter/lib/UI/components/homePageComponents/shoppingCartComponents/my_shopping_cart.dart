import 'package:flutter/material.dart';
import 'package:saree3/UI/components/homePageComponents/shoppingCartComponents/productSelector/product_selector_card.dart';
import 'package:saree3/data/models/product_model.dart';

class MyShoppingCart extends StatelessWidget {
  MyShoppingCart({super.key});

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
      height: 650,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Cart',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_horiz,
                  color: Theme.of(context).colorScheme.onSurface,
                  size: 30,
                ),
              ),
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
        ],
      ),
    );
  }
}
