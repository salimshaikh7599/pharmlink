import 'api_service.dart';

class ProductApi {
  Future<List<dynamic>> getProducts() async {
    try {
      final response = await ApiService.get("products");
      print("Products API Response: $response"); // Debug log
      if (response is List) {
        return response;
      } else if (response is Map && response.containsKey('products')) {
        return response['products'] as List;
      } else {
        throw Exception("Unexpected response format for products");
      }
    } catch (e) {
      print("Products API Error: $e"); // Debug log
      throw e;
    }
  }

  Future<dynamic> getProductById(int id) async {
    return await ApiService.get("products/$id");
  }

  Future<List<dynamic>> searchProducts(String query) async {
    return await ApiService.get("products/search?q=$query");
  }

  Future<dynamic> addProduct(Map<String, dynamic> productData) async {
    return await ApiService.post("products", productData);
  }

  Future<dynamic> updateProduct(
      int id, Map<String, dynamic> productData) async {
    return await ApiService.put("products/$id", productData);
  }

  Future<dynamic> deleteProduct(int id) async {
    return await ApiService.delete("products/$id");
  }
}
