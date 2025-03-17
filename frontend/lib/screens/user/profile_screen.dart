import 'package:flutter/material.dart';
import '../../utils/helpers.dart';

class ProfileScreen extends StatelessWidget {
  final Map<String, dynamic> userData = {
    "user_name": "John Doe",
    "email": "john@example.com",
    "phone_number": "9876543210",
    "date_of_birth": "1995-06-15"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/logo.png'),
            ),
            SizedBox(height: 10),
            Text("Good Afternoon, ${userData['user_name']}!",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              controller: TextEditingController(text: userData['user_name']),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              controller: TextEditingController(text: userData['email']),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(),
              ),
              controller: TextEditingController(text: userData['phone_number']),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Call API to save profile changes.
              },
              child: Text("Save"),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Your Orders",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            ListTile(
              title: Text("Order #1234"),
              subtitle: Text("Delivered - ${formatCurrency(250)}"),
              trailing: ElevatedButton(
                onPressed: () {
                  // Call API to reorder.
                },
                child: Text("Reorder"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
