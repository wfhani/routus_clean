import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:routus_clean/styles.dart';

final ThemeData appTheme = ThemeData(
  primarySwatch: Styles.primaryMaterialColor,
  fontFamily: 'Comfortaa',
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18.sp,
      fontFamily: 'Comfortaa',
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 16.sp,
      fontFamily: 'Comfortaa',
      color: Colors.white,
    ),
    displayLarge: TextStyle(
      fontSize: 24.sp,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  scaffoldBackgroundColor: Colors.transparent,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent, // Transparent to show gradient
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 24.sp,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.bold,
      color: Colors.white, // Ensure the text color is white
    ),
  ),
);

const LinearGradient appGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xff052A43), // Gradient start color
    Color(0xff0D6AA9), // Gradient end color
  ],
);

class GradientScaffold extends StatelessWidget {
  final Widget child;

  const GradientScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: appGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: child,
      ),
    );
  }
}
