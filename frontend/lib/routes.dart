// lib/routes.dart
import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/user/splash_screen.dart';
import 'screens/user/home_screen.dart';
import 'screens/user/search_screen.dart';
import 'screens/user/cart_screen.dart';
import 'screens/user/profile_screen.dart';
import 'screens/pharmacy/pharmacy_home_screen.dart';
import 'screens/pharmacy/upload_csv_screen.dart';
import 'screens/pharmacy/analytics_screen.dart';
import 'screens/admin/admin_dashboard.dart';
import 'screens/admin/manage_pharmacy.dart';
import 'screens/admin/approval_screen.dart';
import 'screens/product/product_details_screen.dart';
import 'screens/product/product_add_edit_screen.dart';
import 'models/product_model.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => SplashScreen(),
  '/login': (context) => LoginScreen(),
  '/register': (context) => RegisterScreen(),
  // User View
  '/home': (context) => HomeScreen(),
  '/search': (context) => SearchScreen(),
  '/cart': (context) => CartScreen(),
  '/profile': (context) => ProfileScreen(),
  // Pharmacy View
  '/pharmacy/home': (context) => PharmacyHomeScreen(),
  '/pharmacy/upload_csv': (context) => UploadCsvScreen(),
  '/pharmacy/analytics': (context) => AnalyticsScreen(),
  // Admin View
  '/admin/dashboard': (context) => AdminDashboard(),
  '/admin/manage': (context) => ManagePharmacy(),
  '/admin/approval': (context) => ApprovalScreen(),
  '/product/details': (context) => ProductDetailsScreen(
        product: ModalRoute.of(context)!.settings.arguments as Product,
      ),
  '/product/add': (context) => ProductAddEditScreen(),
  '/product/edit': (context) => ProductAddEditScreen(
        product: ModalRoute.of(context)!.settings.arguments as Product,
      ),
};
