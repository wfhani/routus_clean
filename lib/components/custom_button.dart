import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

   CustomButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 298.w, // Responsive width
      height: 44.h,  // Responsive height
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:  Color(0xffFDC70A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r), // Responsive radius
          ),
          elevation: 0, // Remove shadow if needed
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.w600, // Semi-bold weight
            fontSize: 20.sp, // Responsive font size
            color:  Color(0xff052A43),
          ),
        ),
      ),
    );
  }
}
