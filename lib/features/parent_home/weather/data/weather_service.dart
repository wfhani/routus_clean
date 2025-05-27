import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:routus_clean/features/parent_home/weather/data/weather_model.dart';

class WeatherService {
  static const String baseUrl = "http://174.129.6.228:8000";
  static const String openWeatherApiKey = "f1bfe0dbd7c15ef3f147f4b3303c0bff";


  Future<String> getAISchoolRecommendation(String city) async {
    final response = await http.get(Uri.parse("$baseUrl/predict/?city=$city"),headers: {"Accept-Language":"ar"});
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data["recommendation"] ?? "No recommendation available.";
    } else {
      throw Exception("Failed to fetch AI recommendation");
    }
  }


  Future<WeatherModel> fetchWeather(String city) async {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$openWeatherApiKey&units=metric"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return WeatherModel.fromJson(data);
    } else {
      throw Exception("Failed to fetch weather data");
    }
  }
}
