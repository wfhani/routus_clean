import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:routus_clean/features/parent_home/presentation/cubit/home_cubit.dart';
import 'package:routus_clean/features/parent_home/presentation/screens/home_screen.dart';
import 'firebase_options.dart'; // Import the generated Firebase config file

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
  await Firebase.initializeApp();

  try {
    await Firebase.initializeApp();
    FirebaseMessaging.instance.getToken().then((token) {
      print("🔥 FCM Token: $token");
    });
  } catch (e) {
    print("❌ Firebase initialization error: $e");
  }

  runApp(MyApp());
  print("🔥 Firebase initialized successfully!"); // Debug message

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appTheme, // Use the theme defined in app_theme.dart
            initialRoute: '/',
            routes: {
              '/': (context) => const HomeScreen(),
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
      ),
    );
  }
}


