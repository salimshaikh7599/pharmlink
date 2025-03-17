// lib/models/product_model.dart
class Product {
  final int productId;
  final String productName;
  final double mrp;
  final String? imageUrl;

  Product({
    required this.productId,
    required this.productName,
    required this.mrp,
    this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['product_id'],
      productName: json['product_name'],
      mrp: double.parse(json['mrp'].toString()),
      imageUrl: json['image_url'],
    );
  }
}
