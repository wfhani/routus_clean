class WeatherModel {
  final String aiRecommendation;
  final double temperature;
  final String description;

  WeatherModel({
    required this.aiRecommendation,
    required this.temperature,
    required this.description,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      aiRecommendation: "Fetching AI recommendation...", // Default value
      temperature: json["main"]["temp"].toDouble(),
      description: json["weather"][0]["description"],
    );
  }

  WeatherModel copyWith({String? aiRecommendation}) {
    return WeatherModel(
      aiRecommendation: aiRecommendation ?? this.aiRecommendation,
      temperature: temperature,
      description: description,
    );
  }
}
