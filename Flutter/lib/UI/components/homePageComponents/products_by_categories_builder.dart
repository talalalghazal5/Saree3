import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:saree3/UI/components/homePageComponents/products_list.dart';
import 'package:saree3/controllers/category_provider.dart';
import 'package:saree3/data/models/category.dart';
import 'package:saree3/data/models/product.dart';
import 'package:saree3/services/home_page_service.dart';

class ProductsByCategoriesBuilder extends StatelessWidget {
  ProductsByCategoriesBuilder({super.key});
  HomePageService homePageService = HomePageService();

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    if (categoryProvider.categories.isEmpty) {
      categoryProvider.fetchCategories();
    }

    return SizedBox(
      height: 800,
      child: ListView.builder(
        itemCount: categoryProvider.categories.isNotEmpty
            ? categoryProvider.categories.length
            : 1,
        itemBuilder: (context, index) {
          if (categoryProvider.categories.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          Category category = categoryProvider.categories[index];
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    category.name!,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  InkWell(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'show more',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(
                                color: Theme.of(context).colorScheme.tertiary,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        FaIcon(
                          FontAwesomeIcons.chevronRight,
                          size: 14,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 250,
                child: FutureBuilder(
                  future: homePageService.getProductsByCategory(category.id!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if(snapshot.data !=null &&snapshot.data!.isEmpty) {
                      return Center(
                        child: Text('No products available', style: Theme.of(context).textTheme.bodySmall,),
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text('An error occured while fetching data', style: Theme.of(context).textTheme.bodySmall,),);
                    } List<Product> products = snapshot.data!;
                      return ProductsList(products: products);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
