// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'dart:async';
// import '../../core/theme/app_theme.dart';
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 1), () {
//       Navigator.pushReplacementNamed(context, '/onboarding1');
//     });
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
//           // Logo
//           Center(
//             child: SvgPicture.asset(
//               'assets/images/splash/logo.svg',
//               width: 322.w,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
