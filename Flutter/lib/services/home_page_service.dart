import 'dart:convert';

import 'package:http/http.dart';
import 'package:saree3/data/models/product.dart';
import 'package:saree3/data/models/category.dart';

class HomePageService {
  final Uri baseUrl = Uri.parse('http://26.30.106.26:1234/api');

  Future<List<Product>> getProducts() async {
    Uri productsUrl = Uri.parse('$baseUrl/products');
    var response = await get(productsUrl);
    if (response.statusCode == 200) {
      List<dynamic> categoriesJson = jsonDecode(response.body);

      return categoriesJson.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('An error occurred');
    }
  }

  Future<List<Category>> getCategories({int count = 20}) async {
    Uri categoriesUrl = Uri.parse('$baseUrl/categories?hasProducts');
    var response = await get(categoriesUrl);

    try {
      Map<String, dynamic> categoriesJson = jsonDecode(response.body);
      if (categoriesJson.containsKey('data')) {
        List<dynamic> categoriesList = categoriesJson['data'];
        var list = categoriesList
            .map((category) => Category.fromJson(category))
            .toList();
        if (list.length > count) {
          return list.sublist(0, count);
        }
        return list;
      } else {
        throw Exception('Data not found');
      }
    } catch (e) {
      throw Exception(response.statusCode);
    }
  }

  Future<List<Product>> getProductsByCategory(int id) async {
    Uri productsUrl = Uri.parse(
      '$baseUrl/products?categoryId=$id',
    );
    try {
      var response = await get(productsUrl);
      print(response.body);
      Map<String, dynamic> categoriesJson = jsonDecode(response.body);
      List<dynamic> categoriesList = categoriesJson['data'];
      print(categoriesList);
      var x = categoriesList.map((product) => Product.fromJson(product));
      return x.toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<Product>> getProductsByMinPrice(double minPrice) async {
    Uri productsUrl = Uri.parse('https://api.example.com/products/$minPrice');
    var response = await get(productsUrl);
    if (response.statusCode == 200) {
      List<dynamic> categoriesJson = jsonDecode(response.body);
      return categoriesJson.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('An error occurred');
    }
  }

  Future<List<Product>> getProductsByMaxPrice(double maxPrice) async {
    Uri productsUrl = Uri.parse('https://api.example.com/products/$maxPrice');
    var response = await get(productsUrl);
    if (response.statusCode == 200) {
      List<dynamic> categoriesJson = jsonDecode(response.body);
      return categoriesJson.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('An error occurred');
    }
  }
}
