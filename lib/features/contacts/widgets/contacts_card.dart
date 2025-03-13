import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ContactsCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String role;

  const ContactsCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w, // Fixed width
      height: 116.h, // Fixed height
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 2.r,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          // **Image**
          Padding(
            padding: EdgeInsets.all(12.w),
            child: SvgPicture.asset(
              imagePath,
              width: 100.w,
              height: 100.h,
              fit: BoxFit.contain, // ✅ Fixes SVG display
            ),
          ),

          // **Text**
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 16.sp, color: const Color(0xFF052A43)),
                ),
                SizedBox(height: 4.h),
                Text(
                  role,
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: const Color(0xFF052A43)),
                ),
              ],
            ),
          ),

          // **Arrow Icon**
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Icon(Icons.arrow_forward_ios, color: const Color(0xFF052A43), size: 18.sp),
          ),
        ],
      ),
    );
  }
}
