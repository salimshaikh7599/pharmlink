// lib/screens/user/home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import 'package:pharmlink_app/models/product_model.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/banner_slider.dart';
import '../../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pharmlink'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await Provider.of<AuthProvider>(context, listen: false).logout();
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BannerSlider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ProductCard(
                    product: Product(
                        productId: 1, productName: "Chloroquine", mrp: 100),
                  ),
                  ProductCard(
                    product: Product(
                        productId: 1, productName: "Chloroquine", mrp: 100),
                  ),
                  ProductCard(
                    product: Product(
                        productId: 1, productName: "Chloroquine", mrp: 100),
                  ),
                  ProductCard(
                    product: Product(
                        productId: 1, productName: "Chloroquine", mrp: 100),
                  ),
                  ProductCard(
                    product: Product(
                        productId: 1, productName: "Chloroquine", mrp: 100),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "DON’T STRESS Mil Jayega On Pharmlink App",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          // Implement tab switching logic here.
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
