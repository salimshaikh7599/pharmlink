// lib/models/user_model.dart
class User {
  final int userId;
  final String userName;
  final String email;
  final String phoneNumber;
  final String pincode;
  final bool isAdmin;
  final bool isPharmacy;

  User({
    required this.userId,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.pincode,
    required this.isAdmin,
    required this.isPharmacy,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      userName: json['user_name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      pincode: json['pincode'],
      isAdmin: json['is_admin'] == 1,
      isPharmacy: json['is_pharmacy'] == 1,
    );
  }
}
