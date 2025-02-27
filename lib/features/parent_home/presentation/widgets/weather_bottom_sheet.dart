// import 'package:flutter/material.dart';
// import '../../weather/data/weather_model.dart';
// void showWeatherReportBottomSheet(BuildContext context, WeatherModel weather) {
//   showModalBottomSheet(
//     context: context,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//     ),
//     builder: (context) {
//       return Container(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text("Weather Report", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 10),
//             Text("Temperature: ${weather.temperature}°C"),
//             Text("Condition: ${weather.description}"),
//             Image.network("https://openweathermap.org/img/wn/${weather.icon}.png"),
//           ],
//         ),
//       );
//     },
//   );
// }
