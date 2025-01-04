import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saree3/controllers/category_provider.dart';
import 'package:saree3/data/models/category.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    if (categoryProvider.categories.isEmpty) {
      categoryProvider.fetchCategories();
    }
    return ListView.builder(
      scrollDirection: Axis.horizontal,
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
            Container(
              width: 30,
              height: 30,
              decoration:
                  const BoxDecoration(color: Colors.greenAccent, shape: BoxShape.circle),
              padding: const EdgeInsets.all(4),
            ),
            Text('${category.name}')
          ],
        );
      },
    );
  }
}
