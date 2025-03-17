// lib/api/order_api.dart
import 'api_service.dart';

class OrderApi {
  Future<dynamic> placeOrder(Map<String, dynamic> data) async {
    return await ApiService.post("orders", data);
  }

  // Add more order-related API calls as needed.
}
