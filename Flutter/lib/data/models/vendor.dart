class Vendor {
  int? id;
  String? name;
  String? contactNumber;
  String? address;
  String? email;

  Vendor({this.id, this.name, this.contactNumber, this.address, this.email});

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      id: json['id'],
      name: json['name'],
      contactNumber: json['contactNumber'],
      address: json['address'],
      email: json['email'],
    );
  }
}