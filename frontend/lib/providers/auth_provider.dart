// lib/providers/auth_provider.dart
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../api/auth_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  User? _user;
  String? _token;

  User? get user => _user;
  String? get token => _token;

  Future<bool> login(String email, String password) async {
    try {
      final response = await AuthApi().login(email, password);
      if (response['token'] != null) {
        _token = response['token'];
        _user = User.fromJson(response['user']);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", _token!);
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      print("Login error: $e");
      return false;
    }
  }

  Future<bool> register(Map<String, dynamic> data) async {
    try {
      final response = await AuthApi().register(data);
      return response['message'] != null;
    } catch (e) {
      print("Registration error: $e");
      return false;
    }
  }

  // Add logout and other methods as needed.
}
