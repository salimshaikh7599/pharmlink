import 'package:flutter/material.dart';
import '../../models/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.productName ?? 'Product Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (product.imageUrl != null)
              Center(
                child: Image.network(
                  product.imageUrl!,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
            SizedBox(height: 20),
            Text(
              product.productName ?? 'N/A',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 10),
            Text(
              'MRP: ₹${product.mrp?.toStringAsFixed(2) ?? 'N/A'}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 20),
            _buildInfoSection('Generic Name', product.generic),
            _buildInfoSection('Type', product.type),
            _buildInfoSection('Uses', product.uses),
            _buildInfoSection('Side Effects', product.sideEffects),
            _buildInfoSection('Interactions', product.interactions),
            SizedBox(height: 10),
            if (product.prescriptionRequired == true)
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.red[100],
                child: Row(
                  children: [
                    Icon(Icons.warning, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Prescription Required',
                        style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(String title, String? content) {
    if (content == null || content.isEmpty) return SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        SizedBox(height: 4),
        Text(content),
        SizedBox(height: 16),
      ],
    );
  }
}