import 'dart:convert';

import 'package:http/http.dart';
import 'package:saree3/data/models/product.dart';
import 'package:saree3/data/models/category.dart';
import 'package:saree3/data/models/vendor.dart';

class HomePageService {
  final Uri baseUrl =
      Uri.parse('https://e4a4-169-150-218-18.ngrok-free.app/api');

  Future<List<Product>> getProducts() async {
    Uri productsUrl = Uri.parse('$baseUrl/products');
    var response = await get(productsUrl);
    if (response.statusCode == 200) {
      List<dynamic> categoriesJson = jsonDecode(response.body);

      return categoriesJson
          .map((product) => Product.fromJson(product))
          .toList();
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
      return categoriesJson
          .map((product) => Product.fromJson(product))
          .toList();
    } else {
      throw Exception('An error occurred');
    }
  }

  Future<List<Product>> getProductsByMaxPrice(double maxPrice) async {
    Uri productsUrl = Uri.parse('https://api.example.com/products/$maxPrice');
    var response = await get(productsUrl);
    if (response.statusCode == 200) {
      List<dynamic> categoriesJson = jsonDecode(response.body);
      return categoriesJson
          .map((product) => Product.fromJson(product))
          .toList();
    } else {
      throw Exception('An error occurred');
    }
  }

  Future<Map<String, dynamic>> search(String query) async {
    Uri searchUrl = Uri.parse('$baseUrl/search?searchQuery=$query');

    var response = await get(searchUrl);
    try {
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        print(responseBody);
        var result = responseBody['data'];
        List<dynamic> productsJson = result['products'];
        List<Product> productsResult = productsJson
            .map(
              (product) => Product.fromJson(product),
            )
            .toList();

        List<dynamic> vendorsJson = result['vendors'];
        List<Vendor> vendorsResult =
            vendorsJson.map((vendor) => Vendor.fromJson(vendor)).toList();

        List<dynamic> categoriesJson = result['categories'];
        List<Category> categoriesResult = categoriesJson
            .map((category) => Category.fromJson(category))
            .toList();

        var searchResult = {
          'products': productsResult,
          'vendors': vendorsResult,
          'categories': categoriesResult,
        };

        return searchResult;
      }
    } catch (e) {
      print(e.toString());
    }
    return {};
  }
}
