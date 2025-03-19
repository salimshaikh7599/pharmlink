// lib/api/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class ApiService {
  static const String baseUrl = API_BASE_URL;
  static String? _authToken;

  static Future<void> setAuthToken(String token) async {
    _authToken = token;
  }

  static Map<String, String> _getHeaders() {
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    if (_authToken != null) {
      headers["Authorization"] = "Bearer $_authToken";
    }
    return headers;
  }

  static Future<dynamic> get(String endpoint) async {
    final response = await http.get(
      Uri.parse("$baseUrl/$endpoint"),
      headers: _getHeaders(),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("GET $endpoint failed: ${response.statusCode}");
    }
  }

  static Future<dynamic> post(
      String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse("$baseUrl/$endpoint"),
      headers: _getHeaders(),
      body: jsonEncode(data),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception("POST $endpoint failed: ${response.statusCode}");
    }
  }

  // Add the PUT method
  static Future<dynamic> put(String endpoint, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse("$baseUrl/$endpoint"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );
    if (response.statusCode == 200 || response.statusCode == 204) {
      // Some PUT responses might not return any content, so handle accordingly.
      return response.body.isNotEmpty ? jsonDecode(response.body) : null;
    } else {
      throw Exception("PUT $endpoint failed: ${response.statusCode}");
    }
  }

  // Add the DELETE method
  static Future<dynamic> delete(String endpoint) async {
    final response = await http.delete(
      Uri.parse("$baseUrl/$endpoint"),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200 || response.statusCode == 204) {
      // Similarly, DELETE responses might return no content.
      return response.body.isNotEmpty ? jsonDecode(response.body) : null;
    } else {
      throw Exception("DELETE $endpoint failed: ${response.statusCode}");
    }
  }
}
