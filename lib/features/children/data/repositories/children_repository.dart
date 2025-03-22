import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/child_model.dart';

class ChildrenRepository {
  final String baseUrl = "https://peaceful-alien-indirectly.ngrok-free.app/api";

  Future<ChildModel> fetchChildProfile(String schoolName, String studentId) async {
    final url = "$baseUrl/student-details?school_name=$schoolName&student_id=$studentId";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      if (jsonData == null || !jsonData.containsKey('id') || !jsonData.containsKey('school_name')) {
        throw Exception("Invalid response from server");
      }

      return ChildModel.fromJson(jsonData);
    } else {
      throw Exception("Failed to fetch child details (Error ${response.statusCode})");
    }
  }
}
