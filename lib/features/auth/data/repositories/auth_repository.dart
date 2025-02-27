import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/login/login_request.dart';
import '../models/login/login_response.dart';
import '../models/register/register_request.dart';  // Import the RegisterRequest model

class AuthRepository {
  final String _baseUrl = 'https://50b8-156-197-158-255.ngrok-free.app/api';

  Future<LoginResponse> login(LoginRequest request) async {
    final url = '$_baseUrl/login';
    print('Making request to: $url'); // Debugging

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }

  // Register method
  Future<LoginResponse> register(RegisterRequest request) async {
    final url = '$_baseUrl/register';  // Assuming a different endpoint for registration
    print('Making request to: $url'); // Debugging

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 201) {  // Check for successful registration
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to register: ${response.body}');
    }
  }
}
