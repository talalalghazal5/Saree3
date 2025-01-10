import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saree3/UI/components/homePageComponents/product_card.dart';
import 'package:saree3/UI/pages/product_detail_page.dart';
import 'package:saree3/controllers/category_provider.dart';
import 'package:saree3/data/models/product.dart';
import 'package:saree3/data/models/vendor.dart';
import 'package:saree3/data/models/category.dart';
import 'package:saree3/services/home_page_service.dart';

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      TextButton(
        onPressed: () => query = '',
        child: Text(
          'Clear',
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: FaIcon(
        FontAwesomeIcons.chevronLeft,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Products:',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: FutureBuilder(
            future: HomePageService().search(query),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('No data found'),
                );
              }
              var searchResult = snapshot.data!;
              List<Product> products = searchResult['products'];
              if (products.isEmpty) {
                return const Center(
                  child: Text('no data found'),
                );
              }
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: products[index],
                    onTap: () => Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                        builder: (context) =>
                            ProductDetailPage(product: products[index]),
                      ),
                    ),
                  );
                },
              );
            },
          )),
          Text(
            'Vendors:',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: FutureBuilder(
            future: HomePageService().search(query),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('No data found'),
                );
              }
              var searchResult = snapshot.data!;
              List<Vendor> vendors = searchResult['vendors'];
              if (vendors.isEmpty) {
                return const Center(
                  child: Text('no data found'),
                );
              }
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: vendors.length,
                itemBuilder: (context, index) {
                  return Text(vendors[index].name!);
                },
              );
            },
          )),
          Text(
            'Categories:',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: FutureBuilder(
            future: HomePageService().search(query),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('No data found'),
                );
              }
              var searchResult = snapshot.data!;
              List<Category> categories = searchResult['categories'];
              if (categories.isEmpty) {
                return const Center(
                  child: Text('no data found'),
                );
              }
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Text(categories[index].name!);
                },
              );
            },
          )),
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Search for products, vendors...'),
    );
  }
}
