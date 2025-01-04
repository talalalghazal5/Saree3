import 'package:flutter/material.dart';
import 'package:saree3/data/models/category.dart';
import 'package:saree3/data/models/product.dart';
import 'package:saree3/data/models/vendor.dart';

class ProductProvider extends ChangeNotifier {
  static List<Product> productsOne = List.generate(
    8,
    (index) => Product(
      id: 1,
      name: 'Gaming Laptop',
      category: Category(id: 1, name: 'laptops'),
      description:
          'Gaming laptop for high requirements applications and 3d max apps.',
      price: 1199.0,
      rating: 4.8,
      stockQuantity: 5,
      totalReviewCount: 10,
      vendor: Vendor(
        id: 1,
        name: 'Asus ROG',
      ),
    ),
  );

 static List <Product> productsTwo = List.generate(8, (index) =>  Product(
      id: 2,
      name: 'iPhone 16 Pro Max',
      category: Category(id: 1, name: 'phones'),
      description:
          'Fancy Powerfull phone.',
      price: 1199.0,
      rating: 4.8,
      stockQuantity: 5,
      totalReviewCount: 10,
      vendor: Vendor(
        id: 3,
        name: 'Apple',
      ),
    ),);

  



}
