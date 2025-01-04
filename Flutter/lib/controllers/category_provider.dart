import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:saree3/data/models/category.dart';
import 'package:saree3/data/models/product.dart';
import 'package:saree3/main.dart';
import 'package:saree3/services/home_page_service.dart';

class CategoryProvider extends ChangeNotifier {
  HomePageService homePageService = HomePageService();
  List<Category> _categories = [];
  List<Product> _productsByCategory = [];

  List<Category> get categories => _categories;
  List<Product> get products => _productsByCategory;

  Future<void> fetchCategories() async {
    try {
      List<Category> fetchedCategories =
          await HomePageService().getCategories(count: 6);
      print(fetchedCategories);
      _categories = fetchedCategories;
      await saveList(categories);
      print(preferences.getString('categories'));
      notifyListeners();
    } catch (e) {
      return;
    }
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
