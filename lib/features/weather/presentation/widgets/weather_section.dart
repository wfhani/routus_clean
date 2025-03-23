import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherSection extends StatelessWidget {
  const WeatherSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 12.h), // 🔹 Reduced horizontal padding
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
                  "The weather is bad today, we recommend not to go to school",
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
            mainAxisAlignment: MainAxisAlignment.center, // 🔹 Centers both items
            children: [
              // 🔹 Full Weather Report Button
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
                    // Handle button press
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

              SizedBox(width: 10.w), // 🔹 Adds spacing between button and icon

              // 🔹 Refresh Icon
              GestureDetector(
                onTap: () {
                  // Handle refresh action
                },
                child: SvgPicture.asset(
                  'assets/icons/refresh.svg',
                  width: 24.w, // Adjust size as needed
                  height: 24.h,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}











