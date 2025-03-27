import 'api_service.dart';

class AuthApi {
  Future<dynamic> login(String email, String password) async {
    final response = await ApiService.post(
        "auth/login", {"email": email, "password": password});
    if (response['token'] != null && response['user'] != null) {
      await ApiService.setAuthToken(response['token']);
    }
    return response;
  }

  Future<dynamic> validate(String token) async {
    await ApiService.setAuthToken(token);
    return await ApiService.get("auth/validate");
  }

  Future<dynamic> register(Map<String, dynamic> data) async {
    return await ApiService.post("auth/register", data);
  }
}
