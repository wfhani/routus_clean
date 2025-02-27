// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'dart:async';
// import 'dart:ui';
//
// import '../../core/theme/app_theme.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   SplashScreenState createState() => SplashScreenState();
// }
//
// class SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
//   late AnimationController fadeController;
//   late Animation<double> fadeAnimation;
//
//   late AnimationController slideController;
//   late Animation<Offset> slideAnimation;
//
//   late AnimationController pathController;
//   late Animation<double> pathAnimation;
//
//   Path busPath = Path();
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Fade-in Animation for Logo
//     fadeController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );
//     fadeAnimation = Tween<double>(begin: 0, end: 1).animate(fadeController);
//     fadeController.forward();
//
//     // Slide-in Animation for Logo (Bottom to Center)
//     slideController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );
//     slideAnimation = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
//         .animate(CurvedAnimation(parent: slideController, curve: Curves.easeOut));
//     slideController.forward();
//
//     // Define the curved path for the bus
//     _createBusPath();
//
//     // Bus following path animation (10s journey)
//     pathController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 10),
//     )..forward();
//     pathAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
//       parent: pathController,
//       curve: Curves.easeInOut,
//     ));
//
//     // Navigate to home screen after 60 seconds
//     Timer(const Duration(seconds: 60), () {
//       Navigator.pushReplacementNamed(context, '/home');
//     });
//   }
//
//   void _createBusPath() {
//     busPath.moveTo(270.w, 200.h); // Start position (right side)
//     busPath.quadraticBezierTo(200.w, 150.h, 120.w, 170.h); // Curve path
//     busPath.quadraticBezierTo(70.w, 180.h, 50.w, 200.h); // End at sun
//   }
//
//   @override
//   void dispose() {
//     fadeController.dispose();
//     slideController.dispose();
//     pathController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GradientScaffold(
//       child: Stack(
//         children: [
//           // Top Decorative Element
//           Positioned(
//             top: 0,
//             right: 0,
//             child: SvgPicture.asset(
//               'assets/images/splash/top_lines.svg',
//               width: 106.w,
//               height: 233.h,
//             ),
//           ),
//           // Bottom Decorative Element
//           Positioned(
//             bottom: 0,
//             left: 0,
//             child: SvgPicture.asset(
//               'assets/images/splash/buttom_lines.svg',
//               width: 106.w,
//               height: 233.h,
//             ),
//           ),
//           // Animated Logo and Elements
//           Center(
//             child: FadeTransition(
//               opacity: fadeAnimation,
//               child: SlideTransition(
//                 position: slideAnimation,
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     // Sun Icon (Destination)
//                     Positioned(
//                       left: 50.w,
//                       top: 200.h,
//                       child: SvgPicture.asset(
//                         'assets/images/splash/sun.svg',
//                         width: 25.w,
//                       ),
//                     ),
//                     // Curved Line (Static)
//                     SvgPicture.asset(
//                       'assets/images/splash/curved_line.svg',
//                       width: 200.w,
//                     ),
//                     // Animated Bus following the path
//                     AnimatedBuilder(
//                       animation: pathAnimation,
//                       builder: (context, child) {
//                         PathMetrics pathMetrics = busPath.computeMetrics();
//                         PathMetric pathMetric = pathMetrics.first;
//                         Tangent? pos = pathMetric.getTangentForOffset(
//                           pathMetric.length * pathAnimation.value,
//                         );
//
//                         return Positioned(
//                           left: pos?.position.dx ?? 50.w,
//                           top: pos?.position.dy ?? 200.h,
//                           child: Transform.rotate(
//                             angle: pos?.angle ?? 0.0, // Rotate bus to match curve
//                             child: SvgPicture.asset(
//                               'assets/images/splash/bus.svg',
//                               width: 25.w,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                     // Logo Text
//                     SvgPicture.asset(
//                       'assets/images/splash/logo.svg',
//                       width: 322.w,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }