import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../utils/theme.dart';

class PharmacyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: pharmacyTheme,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pharmacy Dashboard'),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await Provider.of<AuthProvider>(context, listen: false)
                    .logout();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to the Pharmacy Dashboard',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pharmacy/upload_csv');
                },
                child: Text('Upload Products via CSV'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pharmacy/analytics');
                },
                child: Text('View Analytics'),
              )
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Text('Pharmacy Menu',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                decoration: BoxDecoration(color: Colors.green),
              ),
              ListTile(
                title: Text('Dashboard'),
                onTap: () => Navigator.pushNamed(context, '/pharmacy/home'),
              ),
              ListTile(
                title: Text('Upload CSV'),
                onTap: () =>
                    Navigator.pushNamed(context, '/pharmacy/upload_csv'),
              ),
              ListTile(
                title: Text('Analytics'),
                onTap: () =>
                    Navigator.pushNamed(context, '/pharmacy/analytics'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
