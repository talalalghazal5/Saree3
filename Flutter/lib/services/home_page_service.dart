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
      throw Exception('An error occurred');
    }
  }

  Future<List<Product>> getProductsByCategory(Category category) async {
    Uri productsUrl =
        Uri.parse('https://api.example.com/products/${category.id}');
    var response = await get(productsUrl);
    if (response.statusCode == 200) {
      List<dynamic> productsJson = jsonDecode(response.body);
      return productsJson.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('An error occurred');
    }
  }

  Future<List<Product>> getProductsBy({double? minPrice, double? maxPrice, Category? category, String? name}) async {
    //this is an example query parameters
    String queryParameters = '';
    if (minPrice != null) {
      queryParameters += 'price_gte=$minPrice&';
    }
    if (maxPrice != null) {
      queryParameters += 'price_lte=$maxPrice&';
    }
    if (category != null) {
      queryParameters += 'category_id=${category.id}&';
    }
    if (name != null) {
      queryParameters += 'name_contains=$name&';
    }
    if (queryParameters.isNotEmpty) {
      queryParameters =
          queryParameters.substring(0, queryParameters.length - 1);
    }

    Uri productsUrl = Uri.parse('https://api.example.com/products?$queryParameters',);
    var response = await get(productsUrl);
    if (response.statusCode == 200) {
      List<dynamic> productsJson = jsonDecode(response.body);
      return productsJson.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('An error occurred fetching products');
    }
  }
}
