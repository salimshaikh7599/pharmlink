import 'api_service.dart';

class ProductApi {
  Future<List<dynamic>> getProducts() async {
    final response = await ApiService.get("products");
    if (response is List) {
      return response;
    } else {
      throw Exception("Unexpected response format for products");
    }
  }

  Future<dynamic> getProductById(int id) async {
    return await ApiService.get("products/$id");
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
