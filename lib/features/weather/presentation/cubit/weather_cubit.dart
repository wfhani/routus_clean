import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routus_clean/features/weather/data/weather_api_service.dart';
import 'package:routus_clean/features/weather/data/weather_ai_service.dart';
import 'package:routus_clean/features/weather/data/models/weather_report_model.dart';

/// **States**
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherReportModel weather;
  WeatherLoaded(this.weather);
}

class AIWeatherLoaded extends WeatherState {
  final String recommendation;
  AIWeatherLoaded(this.recommendation);
}

class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}

/// **Weather Cubit**
class WeatherCubit extends Cubit<WeatherState> {
  final WeatherApiService weatherService;
  final WeatherAIService aiService;

  WeatherCubit(this.weatherService, this.aiService) : super(WeatherInitial());

  /// **Fetch Normal Weather**
  Future<void> fetchWeather(String city) async {
    emit(WeatherLoading());

    try {
      final weather = await weatherService.getWeatherReport(city);
      if (weather != null) {
        emit(WeatherLoaded(weather));
      } else {
        emit(WeatherError("Failed to fetch weather"));
      }
    } catch (e, stack) {
      print("🔴 Weather fetch error: $e");
      print("🧱 Stack trace: $stack");
      emit(WeatherError("Failed to fetch weather"));
    }
  }

  /// **Fetch AI Weather Recommendation**
  Future<void> fetchWeatherAI(String city) async {
    emit(WeatherLoading());

    try {
      final recommendation = await aiService.fetchWeatherAI(city);
      if (recommendation != null && recommendation.isNotEmpty) {
        emit(AIWeatherLoaded(recommendation));
      } else {
        emit(WeatherError("No AI recommendation available"));
      }
    } catch (e, stack) {
      print("🔴 AI weather fetch error: $e");
      print("🧱 Stack trace: $stack");
      emit(WeatherError("AI Fetch Error"));
    }
  }
}
