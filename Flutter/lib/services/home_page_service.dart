import 'dart:convert';

import 'package:http/http.dart';
import 'package:saree3/data/models/product.dart';
import 'package:saree3/data/models/category.dart';

class HomePageService {

  final Uri baseUrl = Uri.parse('https://64ab-5-0-175-65.ngrok-free.app/api');

  Future<List<Product>> getProducts() async {
    Uri productsUrl = Uri.parse('$baseUrl/products');
    var response = await get(productsUrl);

    if (response.statusCode == 200) {
      List<dynamic> productsJson = jsonDecode(response.body);
      return productsJson.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('An error occurred');
    }
  }

  Future<List<Category>> getCategories({int count = 20}) async {
    Uri categoriesUrl =
        Uri.parse('$baseUrl/categories?hasProducts');
    var response = await get(categoriesUrl);

    try {
      Map<String, dynamic> categoriesJson = jsonDecode(response.body);
      if (categoriesJson.containsKey('data')) {
        List<dynamic> categoriesList = categoriesJson['data'];
        var list = categoriesList
            .map((category) => Category.fromJson(category))
            .toList();
        if (list.length > count) {
          return list.sublist(0, count + 1);
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
      '$baseUrl/products?category_id=$id',
    );
    try {
    var response = await get(productsUrl);
      Map<String, dynamic> categoriesJson = jsonDecode(response.body);
        List<dynamic> categoriesList = categoriesJson['data'];
        print(categoriesList);
        return categoriesList
            .map((product) => Product.fromJson(product))
            .toList();
      
    } catch (e) {
      return [];
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
