import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:routus_clean/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:routus_clean/features/parent_home/weather/data/weather_model.dart';

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
    print("📡 Fetching Weather Report for ${widget.city}"); // ✅ Debug log
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
  Widget _buildWeatherReport(WeatherModel weather) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Weather Report",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Color(0xff052A43)),
          ),
          SizedBox(height: 10.h),
          Text(
            "${widget.city}, ${weather.description ?? "No data"}",
            style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
          ),
          SizedBox(height: 10.h),
          Text(
            "${weather.temperature?.toStringAsFixed(1) ?? "--"}° C",
            style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold, color: Color(0xff052A43)),
          ),
          SizedBox(height: 10.h),

          // **Weather Details**
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _weatherDetail("Wind", weather.windSpeed ?? "-- km/h", Colors.black),
              _weatherDetail("Humidity", weather.humidity ?? "--%", Colors.black),
              _weatherDetail("UV", weather.uvIndex ?? "--", Colors.black),
            ],
          ),

          SizedBox(height: 20.h),

          // **Hourly Forecast**
          _buildHourlyForecast(weather),

          SizedBox(height: 10.h),

          // **Close Button**
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xffFDC70A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
            child: Text("Close", style: TextStyle(color: Color(0xff052A43))),
          ),
        ],
      ),
    );
  }

  /// **Weather Detail Widget**
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
  Widget _buildHourlyForecast(WeatherModel weather) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF052A43),
            Color(0xFF0D6AA9),
          ],
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: weather.hourlyForecast?.map((hour) {
          return _hourlyForecastItem(hour.time ?? "--", "${hour.temperature ?? "--"}°", hour.weather ?? "☁️");
        }).toList() ?? [],
      ),
    );
  }

  /// **Hourly Forecast Item Widget**
  Widget _hourlyForecastItem(String time, String temp, String icon) {
    return Column(
      children: [
        Text(time, style: TextStyle(fontSize: 14.sp, color: Colors.grey[700])),
        Text(icon, style: TextStyle(fontSize: 18.sp)),
        Text(temp, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
      ],
    );
  }
}


