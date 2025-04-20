import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> showChildSelectorBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
    ),
    builder: (_) => SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 24.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Title
                Text(
                  "Choose child",
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: const Color(0xFF052A43),
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 24.h),

                /// Child Cards
                _childTile("assets/images/child1.png", "Nermin Ahmed", "College school"),
                SizedBox(height: 16.h),
                _childTile("assets/images/child2.png", "Nour Ahmed", "College school"),
                SizedBox(height: 16.h),
                _childTile("assets/images/child3.png", "Rehab Othman", "College school"),

                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _childTile(String img, String name, String school) {
  return Container(
    width: 326.w,
    height: 112.h,
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF052A43), Color(0xFF0D6AA9)],
      ),
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(img),
          radius: 28.r,
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              school,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
