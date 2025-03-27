class CartItem {
  final int cartId;
  final int productId;
  final String productName;
  final int quantity;
  final double mrp;

  CartItem({
    required this.cartId,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.mrp,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      cartId: json['cart_id'],
      productId: json['product_id'],
      productName: json['product_name'] ?? 'Unknown Product',
      quantity: json['quantity'],
      mrp: double.parse(json['mrp'].toString()),
    );
  }
}
