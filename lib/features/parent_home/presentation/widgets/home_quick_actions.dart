import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeQuickActions extends StatelessWidget {
  const HomeQuickActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.w), // ✅ Aligned closer to edges
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildActionButton(
            context,
            "assets/icons/child_profile.svg",
            "Child Profile",
            "/childProfileScreen",
          ),
          _buildActionButton(
            context,
            "assets/icons/face_id.svg",
            "Set Face ID",
            "/faceIdScreen",
          ),
          _buildActionButton(
            context,
            "assets/icons/change_address.svg",
            "Change Address",
            "/changeAddressScreen",
          ),
          _buildActionButton(
            context,
            "assets/icons/report_absent.svg",
            "Report Absent",
            "/reportAbsentScreen",
          ),
        ],
      ),
    );
  }

  /// **Helper function for creating each action button**
  Widget _buildActionButton(
      BuildContext context, String iconPath, String label, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route); // ✅ Navigates to the given screen
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF052A43), // Dark Blue (Top)
                  Color(0xFF0D6AA9), // Light Blue (Bottom)
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  spreadRadius: 2,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                width: 32.w, // ⬆️ **Increased icon size**
                height: 32.h, // ⬆️ **Increased icon size**
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 5.h),
          SizedBox(
            width: 70.w,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'Comfortaa', // ✅ Now uses Comfortaa Regular
                fontWeight: FontWeight.normal, // ✅ Regular weight
                color: Color(0xFF052A43),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}











