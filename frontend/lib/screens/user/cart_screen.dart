import 'package:flutter/material.dart';
import '../../utils/helpers.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [
    {"productName": "Medicine A", "form": "Strip", "mrp": 100.0, "quantity": 2},
    {
      "productName": "Medicine B",
      "form": "Bottle",
      "mrp": 200.0,
      "quantity": 1
    },
  ];

  String deliveryInstruction = "";
  bool requestCardMachine = false;

  double get subTotal =>
      cartItems.fold(0, (sum, item) => sum + (item['mrp'] * item['quantity']));
  double get discount => subTotal * 0.15;
  double get deliveryFee => 20.0;
  double get grandTotal => subTotal - discount + deliveryFee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Review Cart')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.rocket_launch, color: Colors.orange),
                SizedBox(width: 5),
                Text("60 Mins Medicine Delivery!",
                    style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  title: Text(item['productName']),
                  subtitle: Text(item['form']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (item['quantity'] > 1) item['quantity']--;
                          });
                        },
                      ),
                      Text(item['quantity'].toString()),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            if (item['quantity'] < 15) item['quantity']++;
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Add Delivery Instruction',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                deliveryInstruction = value;
              },
            ),
            SizedBox(height: 10),
            Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("Subtotal: ${formatCurrency(subTotal)}"),
                    Text("Discount (15%): ${formatCurrency(discount)}"),
                    Text("Delivery Fee: ${formatCurrency(deliveryFee)}"),
                    Divider(),
                    Text("Grand Total: ${formatCurrency(grandTotal)}",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Payment will be collected at delivery by the pharmacy partner."),
                Text("Available modes: Cash | UPI"),
                Row(
                  children: [
                    Checkbox(
                      value: requestCardMachine,
                      onChanged: (value) {
                        setState(() {
                          requestCardMachine = value ?? false;
                        });
                      },
                    ),
                    Text("Request Card Machines?")
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Call API to place order.
              },
              child: Text("Place Order - Pay ${formatCurrency(grandTotal)}"),
            )
          ],
        ),
      ),
    );
  }
}
