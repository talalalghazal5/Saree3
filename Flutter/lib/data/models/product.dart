import 'package:saree3/data/models/category.dart';
import 'package:saree3/data/models/vendor.dart';

class Product {
  int? id;
  String? name;
  String? description;
  double? price;
  Category? category;
  double? rating;
  int? stockQuantity;
  int? totalReviewCount;
  Vendor? vendor;
  // String imageUrl;

  Product({this.id, this.name, this.description, this.price,  this.category, this.rating,  this.vendor, this.stockQuantity, this.totalReviewCount});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      category: json['category'],
      rating: json['rating'],
      vendor: json['vendor'],
      stockQuantity: json['stockQuantity'],
      totalReviewCount: json['totalReviewCount'],
    );
  }
}
