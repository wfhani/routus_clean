import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDividerWithText extends StatelessWidget {
  final String text;
  final double thickness;
  final double endIndent;
  final double indent;
  final double textSize;

  const CustomDividerWithText({
    Key? key,
    required this.text,
    this.thickness = 1.0,
    this.endIndent = 8.0,
    this.indent = 8.0,
    this.textSize = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: const Color(0xFF747779), // Divider color
            thickness: thickness.sp, // Adjust thickness with ScreenUtil
            endIndent: endIndent.w, // Use ScreenUtil for width spacing
            indent: indent.w, // Use ScreenUtil for width spacing
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.white, // Text color white
            fontSize: textSize.sp, // Adjust font size with ScreenUtil
            fontFamily: 'Comfortaa', // Use Comfortaa font
            fontWeight: FontWeight.w300, // Use Comfortaa-Light (300 weight)
          ),
        ),
        Expanded(
          child: Divider(
            color: const Color(0xFF747779), // Divider color
            thickness: thickness.sp, // Adjust thickness with ScreenUtil
            endIndent: endIndent.w, // Use ScreenUtil for width spacing
            indent: indent.w, // Use ScreenUtil for width spacing
          ),
        ),
      ],
    );
  }
}
