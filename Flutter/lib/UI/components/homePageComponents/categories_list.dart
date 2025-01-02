import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saree3/UI/components/homePageComponents/product_card.dart';
import 'package:saree3/data/models/category.dart';
import 'package:saree3/data/models/product.dart';
import 'package:saree3/services/home_page_service.dart';

class CategoriesList extends StatelessWidget {
  CategoriesList({super.key});
  final HomePageService homePageService = HomePageService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: homePageService.getCategories(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(
              strokeCap: StrokeCap.round,
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var categories = snapshot.data;
                var category = categories![index];
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.inverseSurface.withAlpha(100),
                          shape: BoxShape.circle
                        ),
                        child: Center(
                          child: Text(category.name!),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          }
        } else {
          return Text(snapshot.error.toString());
        } return Placeholder();
      },
    );
  }
}
