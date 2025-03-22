class HourlyForecast {
  final String time;
  final String temperature;
  final String weather;

  HourlyForecast({
    required this.time,
    required this.temperature,
    required this.weather,
  });

  factory HourlyForecast.fromJson(Map<String, dynamic> json) {
    return HourlyForecast(
      time: json['time'] ?? "--",
      temperature: json['temperature']?.toString() ?? "--°",
      weather: json['weather'] ?? "N/A",
    );
  }
}

class WeatherModel {
  final String aiRecommendation;
  final double temperature;
  final String description;
  final String windSpeed;
  final String humidity;
  final String uvIndex;
  final List<HourlyForecast> hourlyForecast; // ✅ Now correctly recognized

  WeatherModel({
    required this.aiRecommendation,
    required this.temperature,
    required this.description,
    this.windSpeed = "-- km/h",
    this.humidity = "--%",
    this.uvIndex = "--",
    this.hourlyForecast = const [],
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      aiRecommendation: json['prediction'] ?? "No AI recommendation available.",
      temperature: (json['temperature'] ?? 0).toDouble(),
      description: json['weather'] ?? "No weather data.",
      windSpeed: json['details']?['wind_speed'] ?? "-- km/h",
      humidity: json['details']?['humidity'] ?? "--%",
      uvIndex: json['details']?['uv_index'] ?? "--",
      hourlyForecast: (json['hourly_forecast'] as List?)?.map((item) =>
          HourlyForecast.fromJson(item)).toList() ?? [],
    );
  }
}






