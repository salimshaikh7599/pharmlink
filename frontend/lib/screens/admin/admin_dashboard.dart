import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with real admin dashboard data and navigation.
    return Scaffold(
      appBar: AppBar(title: Text('Admin Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, Admin!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/admin/manage'),
              child: Text('Manage Pharmacies'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/admin/approval'),
              child: Text('Approve Pharmacies'),
            ),
          ],
        ),
      ),
    );
  }
}
