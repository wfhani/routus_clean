import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../weather/data/weather_service.dart';
import '../weather_cubit.dart';
import '../widgets/weather_section.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(WeatherService())..loadWeather("Cairo"),
      child: Scaffold(
        appBar: AppBar(title: const Text("Parent Home")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),

        ),
      ),
    );
  }
}
