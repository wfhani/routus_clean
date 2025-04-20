import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChildInfoTile extends StatelessWidget {
  final String label;
  final String value;

  const ChildInfoTile({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 13.sp, color: Colors.white60)),
        SizedBox(height: 2.h),
        Text(value, style: TextStyle(fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.bold)),
        SizedBox(height: 12.h),
      ],
    );
  }
}
