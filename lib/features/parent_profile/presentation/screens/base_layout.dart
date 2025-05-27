import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseLayout extends StatelessWidget {
  final Widget child;
  final String? title;
  final String? subtitle;

  const BaseLayout({
    Key? key,
    required this.child,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Gradient Background
        Container(
          height: 220.h,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF052A43), Color(0xFF0D6AA9)],
            ),
          ),
        ),

        /// Header with Icons
        Positioned(
          top: 40.h,
          left: 20.w,
          right: 20.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/settings.svg',
                  width: 28.w,
                  height: 28.h,
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/notification.svg',
                  width: 28.w,
                  height: 28.h,
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/notifications');
                },
              ),
            ],
          ),
        ),

        /// White Card Section (Content Area)
        Positioned.fill(
          top: 120.h,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: child,
          ),
        ),
      ],
    );
  }
}
