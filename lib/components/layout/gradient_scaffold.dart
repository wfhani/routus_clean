import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientScaffold extends StatelessWidget {
  final Widget child;
  final bool showAppBar;
  final PreferredSizeWidget? appBar;

  const GradientScaffold({
    super.key,
    required this.child,
    this.showAppBar = false,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // ✅ Enables automatic resizing
      backgroundColor: const Color(0xFF052A43),
      appBar: showAppBar ? appBar : null,
      body: Stack(
        children: [
          // 🔵 Top Blue Gradient
          Container(
            height: 260.h,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF052A43),
                  Color(0xFF0D6AA9),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // ⚪ White Rounded Overlay
          Positioned(
            top: 180.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(35.r),
                ),
              ),
            ),
          ),

          // 🔳 Foreground content
          SafeArea(
            top: true,
            bottom: false,
            child: child,
          ),
        ],
      ),
    );
  }
}
