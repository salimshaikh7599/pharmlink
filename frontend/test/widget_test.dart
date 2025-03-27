// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pharmlink_app/app.dart';
import 'package:provider/provider.dart';
import 'package:pharmlink_app/providers/auth_provider.dart';
import 'package:pharmlink_app/providers/product_provider.dart';
import 'package:pharmlink_app/providers/cart_provider.dart';
import 'package:pharmlink_app/providers/order_provider.dart';

void main() {
  testWidgets('PharmlinkApp smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => ProductProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => OrderProvider()),
        ],
        child: const PharmlinkApp(),
      ),
    );

    // Verify that the splash screen is shown initially
    expect(find.byType(MaterialApp), findsOneWidget);
    
    // You can add more specific tests here, for example:
    // expect(find.text('Pharmlink'), findsOneWidget);
  });
}
