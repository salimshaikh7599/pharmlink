// lib/app.dart
import 'package:flutter/material.dart';
import 'routes.dart';
import 'utils/theme.dart';

class PharmlinkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pharmlink',
      theme: appTheme, // Default theme (teal)
      initialRoute: '/',
      routes: appRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
