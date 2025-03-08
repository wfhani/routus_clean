import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomToggle extends StatelessWidget {
  final bool isEmailSelected;
  final VoidCallback onToggle;

  const CustomToggle({
    super.key,
    required this.isEmailSelected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Container(
        width: double.infinity,
        height: 46.h, // Outer container height
        decoration: BoxDecoration(
          color: const Color(0xff052A43), // Default navy blue background
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Stack(
          children: [
            // The animated white background for the selected toggle
            AnimatedAlign(
              alignment: isEmailSelected
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: Container(
                width: 0.45.sw, // Half the width of the container
                height: 44.h, // White background height
                decoration: BoxDecoration(
                  color: Colors.white, // White for the selected side
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            // Text for Email and Phone
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          color: isEmailSelected
                              ? const Color(0xff052A43) // Navy blue text for selected
                              : Colors.white, // White text for unselected
                          fontSize: 16.sp,
                          fontFamily: 'Comfortaa',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        'Phone',
                        style: TextStyle(
                          color: isEmailSelected
                              ? Colors.white // White text for unselected
                              : const Color(0xff052A43), // Navy blue text for selected
                          fontSize: 16.sp,
                          fontFamily: 'Comfortaa',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
