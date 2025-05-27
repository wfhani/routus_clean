// lib/features/parent_profile/data/repositories/parent_profile_repository.dart
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../models/parent_profile_model.dart';

class ParentProfileRepository {
  final String baseUrl = "https://bursting-ox-privately.ngrok-free.app/api";
  final http.Client client;

  ParentProfileRepository({http.Client? client})
      : client = client ?? http.Client();

  Future<ParentProfileModel> fetchParentProfile(String email) async {
    final url = Uri.parse('$baseUrl/parent/profile?email=$email');
    print("🌐 Sending GET request to: $url");

    try {
      final response = await client
          .get(url)
          .timeout(const Duration(seconds: 20)); // ⏱ Timeout Added

      print("📥 Response Status: ${response.statusCode}");
      print("📥 Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return ParentProfileModel.fromJson(data);
      } else {
        throw Exception("Failed to fetch profile: ${response.statusCode}");
      }
    } on TimeoutException {
      throw Exception("Request timed out. Please try again.");
    } catch (e) {
      throw Exception("Failed to fetch profile: $e");
    }
  }
}
