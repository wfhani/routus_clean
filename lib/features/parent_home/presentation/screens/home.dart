import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../weather/data/weather_service.dart';
import '../weather_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(WeatherService())..loadWeather("Cairo"),
      child: Scaffold(
        appBar: AppBar(title: const Text("Parent Home")),
        body: const Padding(
          padding: EdgeInsets.all(16.0),

        ),
      ),
    );
  }
}
