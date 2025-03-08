
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../components/custom_button.dart';
import 'widgets/language_button.dart';

void showLanguageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    backgroundColor: Colors.white,
    isScrollControlled: true, // Allows setting a fixed height
    builder: (context) {
      return Container(
        height: 510.h, // Set the height of the bottom sheet
        padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 32.h),
        child: Column(
          children: [
            // SVG Image
            SvgPicture.asset(
              'assets/images/settings/language_img.svg',
              width: 87.w,
              height: 75.h,
            ),

            SizedBox(height: 32.h),

            // Title
            Text(
              "Select Your Language",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'Comfortaa',
                color: const Color(0xff223947),
              ),
            ),

            SizedBox(height: 12.h),

            // Subtitle
            Text(
              "Choose the language you prefer to use within the app for a personalized experience.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'Comfortaa',
                color: const Color(0xff223947),
              ),
            ),

            SizedBox(height: 32.h),

            // Language Buttons
            LanguageButton(language: "English", onTap: () {
              // Handle English selection
            }),
            SizedBox(height: 16.h),
            LanguageButton(language: "Arabic", onTap: () {
              // Handle Arabic selection
            }),

            SizedBox(height: 32.h),

            CustomButton(
              text: 'save',
              onPressed: () {
                // Handle sign up
              },
            ),
          ],
        ),
      );
    },
  );
}
