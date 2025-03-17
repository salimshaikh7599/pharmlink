import 'package:flutter/material.dart';
import '../models/order_model.dart';
import '../api/order_api.dart';

class OrderProvider extends ChangeNotifier {
  List<Order> _orders = [];
  bool _loading = false;
  String? _error;

  List<Order> get orders => _orders;
  bool get loading => _loading;
  String? get error => _error;

  final OrderApi _orderApi = OrderApi();

  Future<void> placeOrder(Map<String, dynamic> data) async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await _orderApi.placeOrder(data);
      Order newOrder = Order.fromJson(response);
      _orders.add(newOrder);
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  // Add additional order methods as needed.
}
