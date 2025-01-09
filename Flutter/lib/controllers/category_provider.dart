import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:saree3/data/models/category.dart';
import 'package:saree3/data/models/product.dart';
import 'package:saree3/main.dart';
import 'package:saree3/services/home_page_service.dart';

class CategoryProvider extends ChangeNotifier {
  HomePageService homePageService = HomePageService();
  List<Category> _categories = [
    Category(id: 1, name: 'earum'),
    Category(id: 2, name: 'nihil'),
    Category(id: 3, name: 'harum'),
    Category(id: 4, name: 'qui'),
    Category(id: 5, name: 'natus'),
  ];
  List<Product> _productsByCategory = [];

  List<Category> get categories => _categories;
  List<Product> get products => _productsByCategory;

  Future<List<Category>> fetchCategories() async {
    try {
      List<Category> fetchedCategories = await HomePageService().getCategories(count: 5);

      print(fetchedCategories);
      _categories = fetchedCategories;
    } catch (e) {
      print(e.hashCode);
    }
      notifyListeners();
      return _categories;
  }

  Future<void> filterProductsByCategory(Category category) async {
    try {
      List<Product> productsByCategory =
          await homePageService.getProductsByCategory(category.id!);
      _productsByCategory = productsByCategory;
      print(productsByCategory);
    } catch (e) {
      return;
    }
  }

  Future<void> saveList(List<Category> list) async {
    String jsonString = jsonEncode(list);
    await preferences.setString('categories', jsonString);
  }

  List<Category> getCachedCategoryList() {
    String? jsonString = preferences.getString('categories');
    if (jsonString != null) {
      List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((item) => item as Category).toList();
    }
    return [];
  }
}
