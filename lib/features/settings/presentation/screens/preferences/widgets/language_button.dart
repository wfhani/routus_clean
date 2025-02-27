import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageButton extends StatelessWidget {
  final String language;
  final VoidCallback onTap;

  const LanguageButton({
    super.key,
    required this.language,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44.h, // Set height to 44.h
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w), // 10 padding inside
          side: const BorderSide(color: Color(0xff223947)),
          backgroundColor: Colors.white,
          shadowColor: const Color(0xff223947),
          elevation: 4, // Adds shadow to the button
        ),
        onPressed: onTap,
        child: Text(
          language,
          style: TextStyle(
            fontSize: 16.sp,

            color: const Color(0xff223947),
          ),
        ),
      ),
    );
  }
}
