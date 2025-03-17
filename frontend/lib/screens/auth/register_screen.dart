import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final dobController = TextEditingController();
  final pincodeController = TextEditingController();

  void _register() async {
    Map<String, dynamic> data = {
      "user_name": nameController.text,
      "email": emailController.text,
      "phone_number": phoneController.text,
      "password": passwordController.text,
      "date_of_birth": dobController.text,
      "pincode": pincodeController.text,
      "is_pharmacy": 0, // For user registration (change to 1 for pharmacy)
      "is_admin": 0
    };
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    bool success = await authProvider.register(data);
    if (success) {
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Registration failed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Name")),
            TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email")),
            TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: "Phone")),
            TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true),
            TextField(
                controller: dobController,
                decoration:
                    InputDecoration(labelText: "Date of Birth (YYYY-MM-DD)")),
            TextField(
                controller: pincodeController,
                decoration: InputDecoration(labelText: "Pincode")),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _register, child: Text("Register"))
          ],
        ),
      ),
    );
  }
}
