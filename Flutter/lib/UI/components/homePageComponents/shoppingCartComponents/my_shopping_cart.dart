import 'package:flutter/material.dart';
import 'package:saree3/services/home_page_service.dart';

class MyShoppingCart extends StatelessWidget {
  MyShoppingCart({super.key});

  HomePageService homePageService = HomePageService();
  

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
            child: FutureBuilder(future: homePageService.getProductsByCategory('commodi'), builder: (context, snapshot) {
              return const Center();

              //Todo: build the list of products.
            },)
          ),
        ],
      ),
    );
  }
}
