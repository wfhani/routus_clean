import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactsCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String role;
  final VoidCallback? onTap;

  const ContactsCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.role,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 327.w,
        height: 116.h,
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 2.r,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Image.asset(
                imagePath,
                width: 100.w,
                height: 100.h,
                fit: BoxFit.cover,
              ),
            ),
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
            Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: Icon(Icons.arrow_forward_ios, color: const Color(0xFF052A43), size: 18.sp),
            ),
          ],
        ),
      ),
    );
  }
}
