import 'package:flutter_bloc/flutter_bloc.dart';
import '../weather/data/weather_model.dart';
import '../weather/data/weather_service.dart';

// 🌤 Weather States
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel weather;
  WeatherLoaded(this.weather);
}

class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}

// 🌤 Weather Cubit
class WeatherCubit extends Cubit<WeatherState> {
  final WeatherService weatherService;

  WeatherCubit(this.weatherService) : super(WeatherInitial());

  Future<void> loadWeather(String city) async {
    emit(WeatherLoading());
    try {
      final weather = await weatherService.fetchWeather(city);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError("Failed to load weather"));
    }
  }
}
