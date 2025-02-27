import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:routus_clean/features/parent_home/presentation/screens/home.dart';

import 'core/theme/app_theme.dart';
import 'features/auth/presentation/screens/forgot_password.dart';
import 'features/auth/presentation/screens/sign_in_screen.dart';
import 'features/auth/presentation/screens/sign_up_screen.dart';
import 'features/onboarding/onboarding1/onboarding1.dart';
import 'features/onboarding/onboarding2/onboarding2.dart';
import 'features/onboarding/onboarding3/onboarding3.dart';
import 'features/settings/presentation/screens/help&support/contact_us.dart';



void main() {
  //init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme, // Use the theme defined in app_theme.dart
          initialRoute: '/',
          routes: {
            '/': (context) => const HomeScreen (),
            '/signin': (context) => SignInScreen(),
            '/signup': (context) => SignUpScreen(),
            '/forgetpassword': (context) => const ForgetPasswordScreen(),
            '/onboarding1': (context) => const Onboarding1(),
            '/onboarding2': (context) => const Onboarding2(),
            '/onboarding3': (context) => const Onboarding3(),
            '/contactus': (context) => const ContactUsScreen(),
          },
        );
      },
    );
  }
}
