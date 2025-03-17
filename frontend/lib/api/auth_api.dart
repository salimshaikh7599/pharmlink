import 'api_service.dart';

class AuthApi {
  Future<dynamic> login(String email, String password) async {
    return await ApiService.post(
        "auth/login", {"email": email, "password": password});
  }

  Future<dynamic> register(Map<String, dynamic> data) async {
    return await ApiService.post("auth/register", data);
  }
}
