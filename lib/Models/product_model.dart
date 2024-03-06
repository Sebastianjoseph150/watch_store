class Product {
  String name;
  String price;
  String image;
  String description;
  int id;
  int quantity;

  Product({
    required this.quantity,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.id,
  });

  // Convert a Product instance to a Map<String, dynamic> for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'description': description,
      'id': id,
      'quantity': quantity,
    };
  }

  // Create a Product instance from a Map<String, dynamic> for JSON deserialization
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'],
      image: json['image'],
      description: json['description'],
      id: json['id'],
      quantity: json['quantity'],
    );
  }
}
