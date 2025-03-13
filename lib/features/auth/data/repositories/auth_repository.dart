import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/login/login_request.dart';
import '../models/login/login_response.dart';
import '../models/register/register_request.dart';
import '../models/register/register_response.dart';

class AuthRepository {
  final String _baseUrl = 'https://bursting-ox-privately.ngrok-free.app/api';
  Future<RegisterResponse> register(RegisterRequest request) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );

    print("📡 Register API Response: ${response.statusCode}, Body: ${response.body}"); // Debug print

    // ✅ Accepts both 200 & 201 as success
    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(response.body);
      final registerResponse = RegisterResponse.fromJson(jsonData);
      await _saveToken(registerResponse.accessToken);
      return registerResponse;
    } else {
      throw Exception(_handleError(response));
    }
  }


  // 🔹 Login API
  Future<LoginResponse> login(LoginRequest request) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final loginResponse = LoginResponse.fromJson(jsonData);
      await _saveToken(loginResponse.accessToken);
      return loginResponse;
    } else {
      throw Exception(_handleError(response));
    }
  }

  // 🔹 Forgot Password API
  Future<void> forgotPassword(String email) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/forgot-password'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );

    if (response.statusCode != 200) {
      throw Exception(_handleError(response));
    }
  }

  // 🔹 Verify OTP API
  Future<void> verifyOTP(String email, String otp) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/verify-otp'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'otp': otp}),
    );

    if (response.statusCode != 200) {
      throw Exception(_handleError(response));
    }
  }

  // 🔹 Reset Password API
  Future<void> resetPassword(String email, String newPassword, String otp) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/reset-password'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'new_password': newPassword, 'otp': otp}),
    );

    if (response.statusCode != 200) {
      throw Exception(_handleError(response));
    }
  }

  // 🔹 Save Token
  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  // 🔹 Handle Errors
  String _handleError(http.Response response) {
    final errorData = jsonDecode(response.body);
    return errorData['message'] ?? 'An unexpected error occurred';
  }
}
