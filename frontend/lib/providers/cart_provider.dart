import 'package:flutter/material.dart';
import '../models/cart_model.dart';
import '../api/cart_api.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];
  bool _loading = false;
  String? _error;

  List<CartItem> get cartItems => _cartItems;
  bool get loading => _loading;
  String? get error => _error;

  final CartApi _cartApi = CartApi();

  /// Adds an item to the cart by calling the API.
  Future<void> addToCart(Map<String, dynamic> data) async {
    try {
      final response = await _cartApi.addToCart(data);
      // Assuming the response contains the newly added cart item as JSON,
      // convert it into a CartItem and update the list.
      if (response != null && response is Map<String, dynamic>) {
        // Create a new CartItem from the response
        CartItem newItem = CartItem.fromJson(response);
        _cartItems.add(newItem);
      }
      // Optionally, log the response:
      print("Cart updated with response: $response");
      notifyListeners();
    } catch (e) {
      print("Error adding to cart: $e");
      _error = e.toString();
      notifyListeners();
    }
  }
}
