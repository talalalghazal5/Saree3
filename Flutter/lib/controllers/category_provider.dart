import 'package:flutter/material.dart';
import 'package:saree3/data/models/category.dart';
import 'package:saree3/services/home_page_service.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> _categories = [];

  List<Category> get categories => _categories;

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
}
