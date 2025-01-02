class Category {
  int? id;

  Category({this.id});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
    );
  }
}
