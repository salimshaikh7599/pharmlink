import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: product.imageUrl != null
                ? Image.network(product.imageUrl!, fit: BoxFit.cover)
                : Placeholder(),
          ),
          SizedBox(height: 8),
          Text(product.productName,
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text("Rs. ${product.mrp.toStringAsFixed(2)}"),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
