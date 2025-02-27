import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_project/features/parent_home/presentation/screens/home.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/screens/forgot_password.dart';
import 'features/auth/presentation/screens/sign_in_screen.dart';
import 'features/auth/presentation/screens/sign_up_screen.dart';
import 'features/onboarding/onboarding1/onboarding1.dart';
import 'features/onboarding/onboarding2/onboarding2.dart';
import 'features/onboarding/onboarding3/onboarding3.dart';
import 'features/onboarding/spla.dart';
import 'features/onboarding/splash.dart';
import 'features/role_selection/presentation/screens/role_selection_screen.dart';
import 'features/settings/presentation/screens/help&support/contact_us.dart';
import 'features/settings/presentation/screens/settings/settings_screen.dart';



void main() {
  //init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
            '/': (context) => HomeScreen (),
            '/signin': (context) => SignInScreen(),
            '/signup': (context) => SignUpScreen(),
            '/forgetpassword': (context) => ForgetPasswordScreen(),
            '/onboarding1': (context) => Onboarding1(),
            '/onboarding2': (context) => Onboarding2(),
            '/onboarding3': (context) => Onboarding3(),
            '/contactus': (context) => ContactUsScreen(),
          },
        );
      },
    );
  }
}
