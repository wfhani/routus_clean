import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ResetButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 327.w, // Responsive width
        height: 40.h,  // Responsive height
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            "Reset notification settings",
            style: TextStyle(
              color: const Color(0xffD32B2B), // Red text color
              fontSize: 16.sp,
              fontFamily: "Comfortaa"
            ),
          ),
        ),
      ),
    );
  }
}
