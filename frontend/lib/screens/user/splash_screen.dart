import 'package:flutter/material.dart';
import 'dart:async';
import 'package:pharmlink_app/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    // Wait for 3 seconds to show splash screen
    await Future.delayed(Duration(seconds: 3));

    bool isAuthorized = await authProvider.isAuthorized();

    if (!mounted) return;

    if (isAuthorized && authProvider.user != null) {
      if (authProvider.user!.isAdmin) {
        Navigator.pushReplacementNamed(context, '/admin/dashboard');
      } else if (authProvider.user!.isPharmacy) {
        Navigator.pushReplacementNamed(context, '/pharmacy/home');
      } else {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/images/logo.png', width: 150)),
    );
  }
}
