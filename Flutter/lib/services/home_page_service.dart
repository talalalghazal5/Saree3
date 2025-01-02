import 'dart:convert';

import 'package:http/http.dart';
import 'package:saree3/data/models/product.dart';
import 'package:saree3/data/models/category.dart';

class HomePageService {
  Future<List<Product>> getProducts() async {
    Uri productsUrl = Uri.parse('https://api.example.com/products');
    var response = await get(productsUrl);

    if (response.statusCode == 200) {
      List<dynamic> productsJson = jsonDecode(response.body);
      return productsJson.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('An error occurred');
    }
  }

  Future<List<Category>> getCategories() async {
    Uri categoriesUrl = Uri.parse('https://api.example.com/categories');
    var response = await get(categoriesUrl);

    if (response.statusCode == 200) {
      List<dynamic> categoriesJson = jsonDecode(response.body);
      return categoriesJson
          .map((category) => Category.fromJson(category))
          .toList();
      } else {
        throw Exception('Data not found');
      }
    } else {
      throw Exception('An error occurred');
    }
  }

  Future<List<Product>> getProductsByCategory(String categoryName) async {
    Uri productsUrl =
        Uri.parse('https://api.example.com/products/$categoryName'); 
    var response = await get(productsUrl);
    if (response.statusCode == 200) {
      List<dynamic> productsJson = jsonDecode(response.body);
      return productsJson.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('An error occurred');
    }
  }

  Future<List<Product>> getProductsByMinPrice(double minPrice) async {
    Uri productsUrl = Uri.parse('https://api.example.com/products/$minPrice');
    var response = await get(productsUrl);
    if (response.statusCode == 200) {
      List<dynamic> productsJson = jsonDecode(response.body);
      return productsJson.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('An error occurred');
    }
  }

  Future<List<Product>> getProductsByMaxPrice(double maxPrice) async {
    Uri productsUrl = Uri.parse('https://api.example.com/products/$maxPrice');
    var response = await get(productsUrl);
    if (response.statusCode == 200) {
      List<dynamic> productsJson = jsonDecode(response.body);
      return productsJson.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('An error occurred');
    }
  }
}
