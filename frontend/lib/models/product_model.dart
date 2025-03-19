// lib/models/product_model.dart
class Product {
  final int productId;
  final String? productName;
  final int? categoryId;
  final int? manufacturerId;
  final String? type;
  final double? mrp;
  final String? generic;
  final String? sideEffects;
  final String? uses;
  final String? interactions;
  final bool? prescriptionRequired;
  final String? imageUrl;

  Product({
    required this.productId,
    this.productName,
    this.categoryId,
    this.manufacturerId,
    this.type,
    this.mrp,
    this.generic,
    this.sideEffects,
    this.uses,
    this.interactions,
    this.prescriptionRequired,
    this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['product_id'],
      productName: json['product_name'],
      categoryId: json['category_id'],
      manufacturerId: json['manufacturer_id'],
      type: json['type'],
      mrp: json['mrp'] != null ? double.parse(json['mrp'].toString()) : null,
      generic: json['generic'],
      sideEffects: json['side_effects'],
      uses: json['uses'],
      interactions: json['interactions'],
      prescriptionRequired: json['prescription_required'] == 1,
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'product_name': productName,
      'category_id': categoryId,
      'manufacturer_id': manufacturerId,
      'type': type,
      'mrp': mrp,
      'generic': generic,
      'side_effects': sideEffects,
      'uses': uses,
      'interactions': interactions,
      'prescription_required': prescriptionRequired ?? 1,
      'image_url': imageUrl,
    };
  }
}
