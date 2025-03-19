import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../api/product_api.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _products = [];
  bool _loading = false;
  String? _error;

  List<Product> get products => List.unmodifiable(_products);
  bool get loading => _loading;
  String? get error => _error;

  final ProductApi _productApi = ProductApi();

  Future<void> fetchProducts() async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await _productApi.getProducts();
      _products
        ..clear()
        ..addAll(response.map((json) => Product.fromJson(json)));
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> addProduct(Map<String, dynamic> productData) async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await _productApi.addProduct(productData);
      final newProduct = Product.fromJson(response);
      _products.add(newProduct);
    } catch (e) {
      _error = e.toString();
      throw e; // Re-throw to handle in UI
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> updateProduct(
      int productId, Map<String, dynamic> productData) async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await _productApi.updateProduct(productId, productData);
      final updatedProduct = Product.fromJson(response);

      final index = _products.indexWhere((p) => p.productId == productId);
      if (index != -1) {
        _products[index] = updatedProduct;
      }
    } catch (e) {
      _error = e.toString();
      throw e; // Re-throw to handle in UI
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
