import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Implement logout logic
      },
      child: Row(
        children: [
          const Icon(Icons.logout, color: Color(0xFFFDC70A)),
          SizedBox(width: 10.w),
          Text(
            "Logout",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF052A43),
            ),
          ),
        ],
      ),
    );
  }
}
