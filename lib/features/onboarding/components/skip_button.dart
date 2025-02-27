import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SkipButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed, // Handle the tap event
      splashColor: Colors.transparent, // No splash effect
      highlightColor: Colors.transparent, // No highlight effect
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.h), // Add padding for better tap area
        child: Text(
          "Skip",
          style: GoogleFonts.comfortaa(
            color: const Color(0xff85A8BF),
            fontSize: 18.sp, // Responsive font size
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}