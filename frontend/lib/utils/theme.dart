// lib/utils/theme.dart
import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primarySwatch: Colors.teal,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.teal,
    elevation: 0,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.teal,
    textTheme: ButtonTextTheme.primary,
  ),
);

// Pharmacy theme: green and white
final ThemeData pharmacyTheme = ThemeData(
  primaryColor: Colors.green,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.green,
    elevation: 0,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.green,
    textTheme: ButtonTextTheme.primary,
  ),
);
