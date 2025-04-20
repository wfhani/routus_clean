import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routus_clean/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:routus_clean/features/weather/presentation/screens/weather_report_screen.dart';

class WeatherSection extends StatelessWidget {
  const WeatherSection({super.key});

  String _selectIcon(String text) {
    final lower = text.toLowerCase();
    if (lower.contains("bad") || lower.contains("not to go")) {
      return 'assets/icons/weather_cloud.svg';
    } else if (lower.contains("moderate") || lower.contains("care")) {
      return 'assets/icons/weather_partly_cloudy.svg';
    } else if (lower.contains("good") || lower.contains("safe to go")) {
      return 'assets/icons/weather_sunny.svg';
    }
    return 'assets/icons/weather_cloud.svg'; // default
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        String recommendationText =
            "Tap the refresh icon to fetch today's weather recommendation.";
        if (state is AIWeatherLoaded) {
          recommendationText = state.recommendation;
        } else if (state is WeatherError) {
          recommendationText = state.message;
        }

        final iconPath = _selectIcon(recommendationText);

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
              Text(
                "Check Today’s Weather",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF052A43),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      recommendationText,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF223947),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  SvgPicture.asset(
                    iconPath,
                    width: 30.w,
                    height: 50.h,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ✅ Weather Report Button → opens dialog
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
                          builder: (_) => BlocProvider.value(
                            value: context.read<WeatherCubit>(),
                            child: const WeatherReportScreen(city: "Cairo"),
                          ),
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
                  GestureDetector(
                    onTap: () {
                      context.read<WeatherCubit>().fetchWeatherAI("Cairo");
                    },
                    child: SvgPicture.asset(
                      'assets/icons/refresh.svg',
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}



