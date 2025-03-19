import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../utils/form_styles.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final dobController = TextEditingController();
  final pincodeController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _validateDOB(String? value) {
    if (value == null || value.isEmpty) {
      return 'Date of birth is required';
    }
    if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(value)) {
      return 'Use format YYYY-MM-DD';
    }
    return null;
  }

  String? _validatePincode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Pincode is required';
    }
    if (!RegExp(r'^\d{6}$').hasMatch(value)) {
      return 'Enter a valid 6-digit pincode';
    }
    return null;
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          DateTime.now().subtract(Duration(days: 6570)), // 18 years ago
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      dobController.text =
          "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
    }
  }

  void _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      Map<String, dynamic> data = {
        "first_name": nameController.text.split(' ')[0],
        "last_name": nameController.text.split(' ').length > 1
            ? nameController.text.split(' ')[1]
            : "",
        "email": emailController.text.trim(),
        "phone_number": phoneController.text,
        "password": passwordController.text,
        "date_of_birth": dobController.text,
        "pincode": pincodeController.text,
        "is_pharmacy": 0,
        "is_admin": 0
      };

      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      bool success = await authProvider.register(data);

      if (!mounted) return;

      if (success) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration failed. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 40),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 120,
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Create Account',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Sign up to get started',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[600],
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    controller: nameController,
                    decoration:
                        FormStyles.inputDecoration('Full Name', Icons.person),
                    validator: _validateName,
                    enabled: !_isLoading,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: emailController,
                    decoration:
                        FormStyles.inputDecoration('Email', Icons.email),
                    keyboardType: TextInputType.emailAddress,
                    validator: _validateEmail,
                    enabled: !_isLoading,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: phoneController,
                    decoration:
                        FormStyles.inputDecoration('Phone', Icons.phone),
                    keyboardType: TextInputType.phone,
                    validator: _validatePhone,
                    enabled: !_isLoading,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: passwordController,
                    decoration:
                        FormStyles.inputDecoration('Password', Icons.lock)
                            .copyWith(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () => setState(
                            () => _obscurePassword = !_obscurePassword),
                      ),
                    ),
                    obscureText: _obscurePassword,
                    validator: _validatePassword,
                    enabled: !_isLoading,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: dobController,
                    decoration: FormStyles.inputDecoration(
                      'Date of Birth',
                      Icons.calendar_today,
                    ).copyWith(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: _isLoading ? null : _selectDate,
                      ),
                    ),
                    validator: _validateDOB,
                    enabled: !_isLoading,
                    readOnly: true,
                    onTap: _isLoading ? null : _selectDate,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: pincodeController,
                    decoration: FormStyles.inputDecoration(
                        'Pincode', Icons.location_on),
                    keyboardType: TextInputType.number,
                    validator: _validatePincode,
                    enabled: !_isLoading,
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _isLoading ? null : _register,
                    style: FormStyles.primaryButtonStyle,
                    child: _isLoading
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : Text('CREATE ACCOUNT'),
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: _isLoading
                        ? null
                        : () =>
                            Navigator.pushReplacementNamed(context, '/login'),
                    child: Text("Already have an account? Login"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
