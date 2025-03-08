import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

void showDeleteAccountDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),backgroundColor: Colors.white ,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Makes dialog height dynamic
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Warning Icon
              SvgPicture.asset(
                'aassets/icons/deleteAccountDialog/Frame.svg',
                width: 32.w,
                height: 32.h,
              ),
              SizedBox(height: 16.h), // Adjusted spacing
              // Title
              Text(
                'Warning:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontFamily: 'Nunito',
                  color: const Color(0xFF052A43),
                ),
              ),
              SizedBox(height: 16.h), // Adjusted spacing
              // Warning text
              Text(
                'Deleting your account will permanently remove all your data, including your personal information, saved preferences, and access to the app. This action cannot be undone. Are you sure you want to proceed?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'Comfortaa',
                  color: const Color(0xFF052A43),
                ),
              ),
              SizedBox(height: 24.h), // Adjusted spacing
              // Buttons row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Cancel button
                  SizedBox(
                    width: 113.w,
                    height: 48.h,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFF5EEEE),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: const Color(0xFF052A43),
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 14.w),
                  // Delete button
                  SizedBox(
                    width: 113.w,
                    height: 48.h,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                        // Add account deletion logic here
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFD32B2B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
