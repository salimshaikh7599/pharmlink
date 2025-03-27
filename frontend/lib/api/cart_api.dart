// lib/api/cart_api.dart
import 'api_service.dart';

class CartApi {
  Future<dynamic> addToCart(Map<String, dynamic> data) async {
    return await ApiService.post("cart", data);
  }

  // Add more cart-related API calls as needed.
}
