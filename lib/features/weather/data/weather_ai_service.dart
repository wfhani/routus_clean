import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherAIService {
  static const String baseUrl = "http://174.129.6.228:8000";
  static const String endpoint = "/predict/";

  /// **Fetch AI Weather Recommendation**
  Future<String?> fetchWeatherAI(String city) async {
    try {
      final Uri url = Uri.parse("$baseUrl$endpoint?city=$city");
      print("🌍 Fetching AI Weather from: $url"); // ✅ Debugging log

      final response = await http.get(url);
      print("🔍 Response Code: ${response.statusCode}");
      print("📜 Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["prediction"] ?? "No AI recommendation available."; // 🔹 Fixed key from "recommendation" to "prediction"
      } else {
        print("❌ API Error: ${response.statusCode}");
        return "Failed to fetch AI recommendation.";
      }
    } catch (e) {
      print("⚠️ Network Error: $e");
      return "Network error occurred.";
    }
  }
}


