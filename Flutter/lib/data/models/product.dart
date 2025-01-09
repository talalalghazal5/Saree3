
class Product {
  int? id;
  String? name;
  String? description;
  double? price;
  String? categoryName;
  int? categoryId;
  double? rating;
  int? stockQuantity;
  int? totalReviewCount;
  String? vendorName;
  int? vendorId;

  Product({this.id, this.name, this.description, this.price, this.categoryName, this.categoryId, this.rating, this.stockQuantity, this.totalReviewCount, this.vendorId, this.vendorName});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      categoryId: json['categoryId'],
      categoryName: json['categoryName'],
      rating: json['rating'],
      stockQuantity: json['stockQuantity'],
      totalReviewCount: json['totalReviewCount'],
      vendorId: json['vendorId'],
      vendorName: json['vendorName']
    );
  }
}
