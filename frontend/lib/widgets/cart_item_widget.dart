import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with dynamic data and proper callbacks
    return ListTile(
      leading: Image.network("http://localhost:5000/uploads/sample.png"),
      title: Text("Product Name"),
      subtitle: Text("Quantity: 1"),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          // Remove item callback
        },
      ),
    );
  }
}
