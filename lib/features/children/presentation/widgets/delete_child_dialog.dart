import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/child_model.dart';
import '../cubit/children_cubit.dart';

class DeleteChildDialog extends StatelessWidget {
  final ChildModel child;

  const DeleteChildDialog({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.r), // ✅ Rounded Corners
      ),
      child: Container(
        width: 280.w,
        height: 231.h,
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 45.h), // ✅ Proper Padding
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ✅ **Dialog Text**
            Text(
              "Are you sure you want to delete this child’s profile?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                fontFamily: "Comfortaa",
                color: const Color(0xFF052A43),
              ),
            ),
            SizedBox(height: 32.h),

            // ✅ **Cancel & Delete Buttons**
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ✅ Cancel Button (Fixed size 113x42)
                SizedBox(
                  width: 113.w,
                  height: 42.h,
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF052A43), width: 1), // ✅ Border
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Comfortaa",
                        color: const Color(0xFF052A43),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 14.w), // ✅ Space between buttons

                // ✅ Delete Button (Fixed size 113x42)
                SizedBox(
                  width: 113.w,
                  height: 42.h,
                  child: TextButton(
                    onPressed: () {
                      context.read<ChildrenCubit>().deleteChild(child.id);
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFD32B2B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                    child: Text(
                      "Delete",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Comfortaa",
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
  }
}
