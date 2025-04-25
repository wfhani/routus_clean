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
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            width: constraints.maxWidth,
            height: 132.h, // ✅ Increased height
            margin: EdgeInsets.only(bottom: 16.h),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4.r,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    imagePath,
                    width: 100.w, // ✅ Increased size
                    height: 100.w,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 100.w,
                      height: 100.w,
                      color: Colors.grey[300],
                      alignment: Alignment.center,
                      child: Icon(Icons.image, size: 24.sp),
                    ),
                  ),
                ),

                SizedBox(width: 16.w),

                /// Text
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 18.sp, // ✅ Larger
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF052A43),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        role,
                        style: TextStyle(
                          fontSize: 16.sp, // ✅ Larger
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF052A43),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 8.w),

                Icon(
                  Icons.arrow_forward_ios,
                  size: 16.sp, // ✅ Balanced size for larger layout
                  color: const Color(0xFF052A43),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
