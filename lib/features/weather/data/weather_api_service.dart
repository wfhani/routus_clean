import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:routus_clean/features/parent_home/weather/data/weather_model.dart';

class WeatherApiService {
  static const String baseUrl = "http://174.129.6.228:8000";
  static const String endpoint = "/predict/";

  /// Fetches raw weather data from the AI API
  Future<Map<String, dynamic>?> fetchWeather({String city = "Cairo"}) async {
    try {
      final Uri url = Uri.parse("$baseUrl$endpoint?city=$city");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print("❌ API Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("⚠️ Network Error: $e");
      return null;
    }
  }

  /// Fetches weather and converts it into a `WeatherModel`
  Future<WeatherModel?> getWeather(String city) async {
    final data = await fetchWeather(city: city);
    if (data != null) {
      return WeatherModel.fromJson(data);
    }
    return null; // Return null if fetching fails
  }
}



