import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageButton extends StatelessWidget {
  final String language;
  final VoidCallback onTap;

  const LanguageButton({
    Key? key,
    required this.language,
    required this.onTap,
  }) : super(key: key);

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
          side: BorderSide(color: Color(0xff223947)),
          backgroundColor: Colors.white,
          shadowColor: Color(0xff223947),
          elevation: 4, // Adds shadow to the button
        ),
        onPressed: onTap,
        child: Text(
          language,
          style: TextStyle(
            fontSize: 16.sp,

            color: Color(0xff223947),
          ),
        ),
      ),
    );
  }
}
