import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:routus_clean/features/weather/data/models/weather_report_model.dart';
import 'dart:io';  // Required for SSL bypass

class WeatherApiService {
  static const String baseUrl = "https://bursting-ox-privately.ngrok-free.app/api";// Your API URL

  Future<WeatherReportModel?> getWeatherReport(String city) async {
    final uri = Uri.parse('$baseUrl/weather?city=$city');
    print("🌐 [DEBUG] Fetching weather from: $uri");

    try {
      final response = await http.get(uri);
      print("📥 [DEBUG] Response Status: ${response.statusCode}");
      print("📥 [DEBUG] Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print("✅ [DEBUG] Weather data fetched successfully: $data");

        return WeatherReportModel.fromJson(data);
      } else {
        print("❌ [DEBUG] Weather API error: ${response.statusCode} ${response.reasonPhrase}");
        return null;
      }
    } catch (e, stack) {
      print("❗ [DEBUG] Exception while fetching weather: $e");
      print("🔍 [DEBUG] Stack Trace: $stack");
      return null;
    }
  }

}
