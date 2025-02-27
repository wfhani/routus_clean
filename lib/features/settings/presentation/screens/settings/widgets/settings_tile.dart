import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback onTap;

  const SettingsTile({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            // ✅ Fix for Icons Not Showing
            SvgPicture.asset(
              iconPath,
              width: 18.w,
              height: 18.h,
              semanticsLabel: title, // Helps debug missing icons
            ),
            SizedBox(width: 32.w),

            // ✅ Updated Text Color & Styling
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff052A43),
                ),
              ),
            ),

            // ✅ Arrow Icon
            SvgPicture.asset(
              'assets/icons/settings_icons/arrow.svg',
              width: 12.w,
              height: 12.h,
            ),
          ],
        ),
      ),
    );
  }
}
