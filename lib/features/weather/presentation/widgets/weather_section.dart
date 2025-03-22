import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routus_clean/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:routus_clean/features/parent_home/weather/data/weather_model.dart';
import 'package:routus_clean/features/weather/presentation/screens/weather_report_screen.dart';

class WeatherSection extends StatelessWidget {
  const WeatherSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return _buildLoadingState();
        } else if (state is WeatherLoaded) {
          return _buildWeatherContent(state.weather, context);
        } else if (state is AIWeatherLoaded) {
          return _buildAIWeatherContent(state.recommendation, context);
        } else if (state is WeatherError) {
          return _buildErrorState(state.message);
        } else {
          return _buildInitialState(context);
        }
      },
    );
  }

  /// **Initial state before fetching weather**
  /// **Initial state before fetching weather**
  Widget _buildInitialState(BuildContext context) {
    return _buildWeatherContent(
      WeatherModel(
        aiRecommendation: "Fetching AI recommendation...",
        temperature: 0.0,
        description: "Loading...",
        windSpeed: "-- km/h",  // ✅ Default value
        humidity: "--%",  // ✅ Default value
        uvIndex: "--",  // ✅ Default value
        hourlyForecast: [],  // ✅ Empty list as default
      ),
      context,
    );
  }


  /// **Loading UI**
  Widget _buildLoadingState() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  /// **Error UI**
  Widget _buildErrorState(String message) {
    return Center(
      child: Text("Failed to load weather: $message"),
    );
  }

  /// **Weather Content UI**
  Widget _buildWeatherContent(WeatherModel weather, BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // **Weather Title**
          Text(
            "Check Today’s Weather",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Color(0xFF052A43),
            ),
          ),

          SizedBox(height: 10.h),

          // **Weather Description**
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  weather.aiRecommendation, // ✅ Show AI Recommendation
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF223947),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              SvgPicture.asset(
                'assets/icons/weather_cloud.svg',
                width: 30.w,
                height: 50.h,
              ),
            ],
          ),

          SizedBox(height: 20.h),

          // **Full Weather Report Button + Refresh Icon**
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Full Weather Report Button
              Container(
                width: 196.w,
                height: 38.h,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF052A43), Color(0xFF0D6AA9)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const WeatherReportScreen(city: "Cairo"),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    minimumSize: Size(196.w, 38.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    "Full weather report",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(width: 10.w),

              // Refresh Icon
              GestureDetector(
                onTap: () {
                  BlocProvider.of<WeatherCubit>(context).fetchWeatherAI("Cairo"); // ✅ Fetch AI Weather
                },
                child: SvgPicture.asset(
                  'assets/icons/refresh.svg',
                  width: 24.w,
                  height: 24.h,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFFFDC70A),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// **AI Weather Content UI (Newly added)**
  Widget _buildAIWeatherContent(String aiRecommendation, BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // **Title**
          Text(
            "AI Weather Insights",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Color(0xFF052A43),
            ),
          ),

          SizedBox(height: 10.h),

          // **AI Recommendation**
          Text(
            aiRecommendation,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              color: Color(0xFF223947),
            ),
          ),

          SizedBox(height: 20.h),

          // **Full Weather Report Button + Refresh Icon**
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 196.w,
                height: 38.h,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF052A43), Color(0xFF0D6AA9)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    minimumSize: Size(196.w, 38.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    "Full weather report",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(width: 10.w),

              // **Refresh Icon**
              GestureDetector(
                onTap: () {
                  BlocProvider.of<WeatherCubit>(context).fetchWeatherAI("Cairo"); // ✅ AI Fetch
                },
                child: SvgPicture.asset(
                  'assets/icons/refresh.svg',
                  width: 24.w,
                  height: 24.h,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFFFDC70A),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
















