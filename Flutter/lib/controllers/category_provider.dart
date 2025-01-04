import 'package:flutter/material.dart';
import 'package:saree3/data/models/category.dart';
import 'package:saree3/data/models/product.dart';
import 'package:saree3/services/home_page_service.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> _categories = [];
  List<Product> _productsByCategory= []; 

  List<Category> get categories => _categories;
  List<Product> get products => _productsByCategory;

  Future<void> fetchCategories() async {
    try {
      List<Category> fetchedCategories =
          await HomePageService().getCategories(count: 6);
      _categories = fetchedCategories;
    } catch (e) {
      return;
    }
    notifyListeners();
  }

  Future<void> filterProductsByCategory(Category category) async {
    try {
      List<Product> productsByCategory = await HomePageService().getProductsByCategory(category.id!);
      _productsByCategory = productsByCategory;
    } catch (e) {
      return;
    }
  }

}
