import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/child_model.dart';
import 'delete_child_dialog.dart'; // ✅ Import the new dialog

class ChildCard extends StatelessWidget {
  final ChildModel child;

  const ChildCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 329.w,
      height: 112.h,
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // ✅ Child Profile Image (80x80 rectangle, radius 10)
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.network(
                child.photo,
                width: 80.w,
                height: 80.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/default_avatar.png',
                    width: 80.w,
                    height: 80.h,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            SizedBox(width: 12.w),

            // ✅ Name & School (Expanded to prevent overflow)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    child.name,
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF052A43), // ✅ Dark Blue Color
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis, // ✅ Prevents overflow
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    child.schoolName,
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF052A43), // ✅ Dark Blue Color
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis, // ✅ Prevents overflow
                  ),
                ],
              ),
            ),

            SizedBox(width: 8.w), // ✅ Ensures spacing

            // ✅ Delete Button (Fixed Size)
            SizedBox(
              width: 36.w, // ✅ Prevents icon from pushing Row out of bounds
              child: IconButton(
                icon: Icon(Icons.delete, color: Colors.red, size: 24.sp),
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => DeleteChildDialog(child: child), // ✅ Uses refactored dialog
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
