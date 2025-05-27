// C:\Users\Shahd\IdeaProjects\routus_clean\lib\features\weather\presentation\screens\weather_report_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:routus_clean/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:routus_clean/features/weather/data/models/weather_report_model.dart';

class WeatherReportScreen extends StatefulWidget {
  final String city;

  const WeatherReportScreen({super.key, required this.city});

  @override
  _WeatherReportScreenState createState() => _WeatherReportScreenState();
}

class _WeatherReportScreenState extends State<WeatherReportScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherCubit>(context).fetchWeather(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.r)),
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return _buildLoadingState();
          } else if (state is WeatherLoaded) {
            return _buildWeatherReport(state.weather);
          } else if (state is WeatherError) {
            return _buildErrorState(state.message);
          } else {
            return _buildLoadingState();
          }
        },
      ),
    );
  }

  /// **Loading UI**
  Widget _buildLoadingState() {
    return SizedBox(
      height: 300.h,
      child: Center(child: CircularProgressIndicator()),
    );
  }

  /// **Error UI**
  Widget _buildErrorState(String message) {
    return SizedBox(
      height: 300.h,
      child: Center(
        child: Text(
          "Failed to load weather: $message",
          style: TextStyle(color: Colors.red, fontSize: 16.sp),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  /// **Weather Report UI**
  Widget _buildWeatherReport(WeatherReportModel weather) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        color: Colors.white, // Card Background Color
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Weather Report",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff052A43), // Text in Dark Blue
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "${weather.city}, ${weather.description}",
              style: TextStyle(color: Color(0xff052A43),fontSize: 15.sp,),
            ),
            Text(
              "${weather.temperature.toStringAsFixed(1)}° C",
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff052A43),
              ),
            ),
            SizedBox(height: 10.h),

            // Wind, Humidity, UV Index
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _weatherDetail("Wind", weather.windSpeed, Color(0xff052A43)),
                _weatherDetail("Humidity", weather.humidity, Color(0xff052A43)),
                _weatherDetail("UV", weather.uvIndex, Color(0xff052A43)),
              ],
            ),
            SizedBox(height: 20.h),

            // Sunrise and Sunset
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _weatherDetail("Sunrise", weather.sunrise, Color(0xff052A43)),
                _weatherDetail("Sunset", weather.sunset, Color(0xff052A43)),
              ],
            ),

            SizedBox(height: 20.h),
            _buildHourlyForecast(weather),

            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffFDC70A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
              child: Text(
                "Close",
                style: TextStyle(color: Color(0xff052A43)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// **Weather Detail Widget (Customized for Color)**
  Widget _weatherDetail(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            color: color,
          ),
        ),
      ],
    );
  }

  /// **Hourly Forecast Widget**
  Widget _buildHourlyForecast(WeatherReportModel weather) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Hourly Forecast", style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff052A43),)),
        SizedBox(height: 10.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: weather.hourlyForecast.map((hour) {
              return Container(
                padding: EdgeInsets.all(10.w),
                margin: EdgeInsets.only(right: 10.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff052A43), // Dark Blue at the top
                      Color(0xff0D6AA9), // Light Blue at the bottom
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(hour.time, style: TextStyle(fontSize: 14.sp)),
                    Text("${hour.temperature.toStringAsFixed(1)}° C",
                        style: TextStyle(fontSize: 16.sp)),
                    Text(hour.weather),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
