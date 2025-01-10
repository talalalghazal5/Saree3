class Vendor {
  int? id;
  String? name;

  Vendor({this.id, this.name});

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      id: json['id'],
      name: json['name'],
    );
  }
}