import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/screens/forgot_password.dart';
import 'features/auth/presentation/screens/sign_in_screen.dart';
import 'features/auth/presentation/screens/sign_up_screen.dart';
import 'features/onboarding/onboarding1/onboarding1.dart';
import 'features/onboarding/onboarding2/onboarding2.dart';
import 'features/onboarding/onboarding3/onboarding3.dart';
import 'features/settings/presentation/screens/help&support/contact_us.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
    FirebaseMessaging.instance.getToken().then((token) {
      print("🔥 FCM Token: $token");
    });
  } catch (e) {
    print("❌ Firebase initialization error: $e");
  }

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
          theme: appTheme, // Using the custom theme
          initialRoute: '/',
          routes: {
            '/': (context) => SignInScreen(),
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
