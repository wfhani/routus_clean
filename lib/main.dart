import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:routus_clean/features/children/data/repositories/children_repository.dart';
import 'package:routus_clean/features/children/presentation/cubit/children_cubit.dart';
import 'package:routus_clean/features/children/presentation/screens/add_children_screen.dart';

import 'core/theme/app_theme.dart';
import 'features/auth/data/repositories/auth_repository.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/auth/presentation/screens/forgot_password.dart';
import 'features/auth/presentation/screens/sign_in_screen.dart';
import 'features/auth/presentation/screens/sign_up_screen.dart';
import 'features/onboarding/onboarding1/onboarding1.dart';
import 'features/onboarding/onboarding2/onboarding2.dart';
import 'features/onboarding/onboarding3/onboarding3.dart';
import 'features/settings/presentation/screens/help&support/contact_us.dart';
import 'features/parent_home/presentation/cubit/home_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  // ✅ Retrieve FCM Token (For Push Notifications)
  try {
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    print("🔥 FCM Token: $fcmToken");
  } catch (e) {
    print("❌ Firebase Messaging error: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()), // ✅ HomeCubit
        BlocProvider(create: (context) => AuthCubit(AuthRepository())),
        BlocProvider(create: (context) => ChildrenCubit(ChildrenRepository())),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            initialRoute: '/',
            routes: {
              '/': (context) => AddChildrenScreen(),
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
