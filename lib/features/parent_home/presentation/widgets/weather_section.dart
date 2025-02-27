// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../weather_cubit.dart';
// import 'weather_bottom_sheet.dart';
//
// class WeatherSection extends StatelessWidget {
//   final String city;
//
//   const WeatherSection({Key? key, required this.city}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<WeatherCubit, WeatherState>(
//       builder: (context, state) {
//         if (state is WeatherLoading) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (state is WeatherLoaded) {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "AI School Recommendation",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 5),
//               Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: Colors.blue.shade50,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Text(state.weather.aiRecommendation, style: const TextStyle(fontSize: 14)),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () => showWeatherReportBottomSheet(context, state.weather),
//                 child: const Text("Show Full Weather Report"),
//               ),
//             ],
//           );
//         } else {
//           return const Text("Error loading weather");
//         }
//       },
//     );
//   }
// }
