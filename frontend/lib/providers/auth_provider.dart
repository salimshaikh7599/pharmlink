// lib/providers/auth_provider.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../api/auth_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  User? _user;
  String? _token;

  User? get user => _user;
  String? get token => _token;

  Future<bool> isAuthorized() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedToken = prefs.getString("token");

    if (storedToken != null) {
      try {
        final response = await AuthApi().validate(storedToken);
        if (response != null && response['user'] != null) {
          _token = storedToken;
          _user = User.fromJson(response['user']);
          notifyListeners();
          return true;
        }
      } catch (e) {
        print("Token validation failed: $e");
        await prefs.remove("token");
      }
    }
    return false;
  }

  Future<bool> login(String email, String password) async {
    try {
      final response = await AuthApi().login(email, password);
      if (response['token'] != null && response['user'] != null) {
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
      print(response);
      // save the token in local storage
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", response['token']);
      _token = response['token'];
      return response['message'] != null;
    } catch (e) {
      print("Registration error: $e");
      return false;
    }
  }

  Future<void> logout() async {
    _user = null;
    _token = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
    notifyListeners();
  }
}
