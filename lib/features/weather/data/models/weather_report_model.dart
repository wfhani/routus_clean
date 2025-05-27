// C:\Users\Shahd\IdeaProjects\routus_clean\lib\features\weather\data\models\weather_report_model.dart
class WeatherReportModel {
  final String city;
  final String date;
  final double temperature;
  final String description;
  final String windSpeed;
  final String humidity;
  final String uvIndex;
  final String sunrise;
  final String sunset;
  final List<HourlyForecast> hourlyForecast;

  WeatherReportModel({
    required this.city,
    required this.date,
    required this.temperature,
    required this.description,
    required this.windSpeed,
    required this.humidity,
    required this.uvIndex,
    required this.sunrise,
    required this.sunset,
    required this.hourlyForecast,
  });

  factory WeatherReportModel.fromJson(Map<String, dynamic> json) {
    return WeatherReportModel(
      city: json['city'] ?? '',
      date: json['date'] ?? '',
      temperature: (json['temperature'] ?? 0.0).toDouble(),
      description: json['weather'] ?? '',
      windSpeed: json['details']?['wind_speed']?.toString() ?? '--',
      humidity: json['details']?['humidity']?.toString() ?? '--',
      uvIndex: json['details']?['uv_index']?.toString() ?? '--',
      sunrise: json['details']?['sunrise'] ?? '--',
      sunset: json['details']?['sunset'] ?? '--',
      hourlyForecast: (json['hourly_forecast'] as List<dynamic>?)
          ?.map((hour) => HourlyForecast.fromJson(hour))
          .toList() ??
          [],
    );
  }
}

class HourlyForecast {
  final String time;
  final double temperature;
  final String weather;

  HourlyForecast({
    required this.time,
    required this.temperature,
    required this.weather,
  });

  factory HourlyForecast.fromJson(Map<String, dynamic> json) {
    return HourlyForecast(
      time: json['time'] ?? '--',
      temperature: (json['temperature'] ?? 0.0).toDouble(),
      weather: json['weather'] ?? '--',
    );
  }
}
