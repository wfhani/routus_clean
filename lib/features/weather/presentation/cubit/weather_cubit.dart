import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routus_clean/features/weather/data/weather_api_service.dart';
import 'package:routus_clean/features/weather/data/weather_ai_service.dart';
import 'package:routus_clean/features/parent_home/weather/data/weather_model.dart';

/// **States**
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel weather;
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
    emit(WeatherLoading()); // ✅ Show loading before fetching

    try {
      final weather = await weatherService.getWeather(city);
      if (weather != null) {
        emit(WeatherLoaded(weather));
      } else {
        emit(WeatherError("Failed to fetch weather"));
      }
    } catch (e) {
      emit(WeatherError("Error: ${e.toString()}"));
    }
  }

  /// **Fetch AI Weather Recommendation**
  Future<void> fetchWeatherAI(String city) async {
    emit(WeatherLoading()); // ✅ Show loading before fetching AI recommendation

    try {
      final recommendation = await aiService.fetchWeatherAI(city);
      if (recommendation != null && recommendation.isNotEmpty) {
        emit(AIWeatherLoaded(recommendation));
      } else {
        emit(WeatherError("No AI recommendation available"));
      }
    } catch (e) {
      emit(WeatherError("AI Fetch Error: ${e.toString()}"));
    }
  }
}




