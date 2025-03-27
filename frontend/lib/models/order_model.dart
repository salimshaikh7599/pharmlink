class Order {
  final int orderId;
  final int userId;
  final double total;
  final String status;
  final String timestamp;

  Order({
    required this.orderId,
    required this.userId,
    required this.total,
    required this.status,
    required this.timestamp,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['order_id'],
      userId: json['user_id'],
      total: double.parse(json['total'].toString()),
      status: json['status'],
      timestamp: json['timestamp'],
    );
  }
}
