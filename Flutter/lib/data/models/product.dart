import 'package:saree3/data/models/category.dart';

class Product {
  int? id;
  String? name;
  double? price;
  Category? category;
  double? rating;

  Product({
   this.id,
   this.name,
   this.price,
   this.category,
   this.rating
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      category: json['category'],
      rating: json['rating'],
    );
  }
}
