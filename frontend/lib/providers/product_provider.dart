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
}
