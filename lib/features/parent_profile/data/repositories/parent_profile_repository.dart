import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/parent_profile_model.dart';

class ParentProfileRepository {
  Future<ParentProfileModel> fetchParentProfile() async {
    try {
      final response = await http.get(
        Uri.parse('https://bursting-ox-privately.ngrok-free.app/api/parent/profile'),
        headers: {
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return ParentProfileModel.fromJson(jsonData['data']);
      } else {
        throw HttpException('Failed to fetch profile: ${response.statusCode}');
      }
    } on SocketException {
      throw HttpException('No Internet connection');
    } on FormatException {
      throw HttpException('Bad response format');
    } catch (e) {
      throw HttpException('Unexpected error: $e');
    }
  }

  Future<void> updateParentProfile(ParentProfileModel profile) async {
    // Implement update logic here
  }

  Future<void> updateProfilePicture(String imagePath) async {
    // Implement upload image logic here
  }
}
