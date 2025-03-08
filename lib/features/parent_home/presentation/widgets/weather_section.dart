import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherSection extends StatelessWidget {
  const WeatherSection({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Mocked weather data (Replace with API later)
    final String description = "The weather is bad today, we recommend not to go to school";
    final double temperature = 18.5;
    final String iconUrl = "https://openweathermap.org/img/wn/10d.png"; // Example icon

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Check Today's Weather",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Comfortaa',
            color: Color(0xFF052A43),
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          description,
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'Comfortaa',
            color: Colors.black54,
          ),
        ),
        SizedBox(height: 15.h),
        Row(
          children: [
            Image.network(
              iconUrl, // Mock icon
              width: 50.w,
              height: 50.h,
            ),
            SizedBox(width: 10.w),
            Text(
              "${temperature.toStringAsFixed(1)}°C",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xFF052A43),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
