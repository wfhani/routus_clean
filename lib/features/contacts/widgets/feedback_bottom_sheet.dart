import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<void> showFeedbackBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (_) => Container(
      height: 440.h,
      padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Title using Theme
          Text(
            "Share Your Thoughts",
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: const Color(0xFF223947), // Override white for this screen
            ),
          ),

          SizedBox(height: 20.h),

          /// Call & Message Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/call.svg',
                width: 56.w,
                height: 56.h,
              ),
              SizedBox(width: 40.w),
              SvgPicture.asset(
                'assets/icons/message.svg',
                width: 56.w,
                height: 56.h,
              ),
            ],
          ),

          SizedBox(height: 24.h),

          /// Satisfaction Label
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "How satisfied are you ?",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: const Color(0xFF223947),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          SizedBox(height: 16.h),

          /// Emoji Rating Row (each inside a 50x50 container)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _EmojiIcon(icon: Icons.sentiment_very_dissatisfied),
              _EmojiIcon(icon: Icons.sentiment_dissatisfied),
              _EmojiIcon(icon: Icons.sentiment_neutral),
              _EmojiIcon(icon: Icons.sentiment_satisfied),
              _EmojiIcon(icon: Icons.sentiment_very_satisfied),
            ],
          ),

          SizedBox(height: 24.h),

          /// Feedback Text Field
          TextField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: "Tell us about your experience.",
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: const Color(0xFF223947),
              ),
              contentPadding: EdgeInsets.all(16.w),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: const Color(0xFFADADAD),),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class _EmojiIcon extends StatelessWidget {
  final IconData icon;
  const _EmojiIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.w,
      height: 50.h,
      child: Center(
        child: Icon(
          icon,
          color: const Color(0xFFADADAD),
          size: 50.sp,
        ),
      ),
    );
  }
}
