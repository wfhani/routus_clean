import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:routus_clean/core/theme/app_theme.dart';
import 'package:routus_clean/firebase_options.dart';

import 'package:routus_clean/features/auth/data/repositories/auth_repository.dart';
import 'package:routus_clean/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:routus_clean/features/auth/presentation/screens/forgot_password.dart';
import 'package:routus_clean/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:routus_clean/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:routus_clean/features/auth/presentation/screens/OTP_verification.dart';

import 'package:routus_clean/features/chat/data/presentation/chat/chat_view.dart';

import 'package:routus_clean/features/children/data/repositories/children_repository.dart';
import 'package:routus_clean/features/children/presentation/cubit/children_cubit.dart';
import 'package:routus_clean/features/children/presentation/screens/add_children_screen.dart';
import 'package:routus_clean/features/contacts/contacts_screen.dart';
import 'package:routus_clean/features/notifications/presentaion/notifications/notifications_view.dart';

import 'package:routus_clean/features/child_profile/presentation/screens/child_profile_screen.dart';
import 'package:routus_clean/features/parent_home/presentation/cubit/home_cubit.dart';
import 'package:routus_clean/features/parent_home/presentation/screens/home_screen.dart';

import 'package:routus_clean/features/notifications/presentation/screens/notification_screen.dart';
import 'package:routus_clean/features/role_selection/presentation/screens/role_selection_screen.dart';

import 'package:routus_clean/features/onboarding/onboarding1/onboarding1.dart';
import 'package:routus_clean/features/onboarding/onboarding2/onboarding2.dart';
import 'package:routus_clean/features/onboarding/onboarding3/onboarding3.dart';

import 'package:routus_clean/features/settings/presentation/screens/settings/settings_screen.dart';
import 'package:routus_clean/features/settings/presentation/screens/help&support/contact_us.dart';

import 'package:routus_clean/features/parent_profile/data/repositories/parent_profile_repository.dart';
import 'package:routus_clean/features/parent_profile/presentation/cubit/parent_profile_cubit.dart';
import 'package:routus_clean/features/parent_profile/presentation/screens/parent_profile_screen.dart';

import 'package:routus_clean/core/cubit/locale_cubit.dart';

import 'package:routus_clean/features/report_absent/data/repository/absence_repository.dart';
import 'package:routus_clean/features/report_absent/presentation/cubit/absence_cubit.dart';
import 'package:routus_clean/features/report_absent/presentation/screens/report_absent_screen.dart';

import 'package:routus_clean/features/face_id/face_id_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
  } catch (e) {
    print("Firebase initialization failed: $e");
  }

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

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
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => AuthCubit(AuthRepository())),
        BlocProvider(create: (context) => ChildrenCubit(ChildrenRepository())),
        BlocProvider(create: (context) => LocaleCubit()),
        BlocProvider(
          create: (context) =>
              ParentProfileCubit(ParentProfileRepository()),
        ),
        BlocProvider(create: (_) => AbsenceCubit(AbsenceRepository())),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return BlocBuilder<LocaleCubit, Locale>(
            builder: (context, locale) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: appTheme,
                locale: locale,
                supportedLocales: const [
                  Locale('en'),
                  Locale('ar'),
                ],
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                initialRoute: '/',
                routes: {
                  // Common and merged routes
                  '/': (context) => const HomeScreen(),
                  '/signin': (context) => SignInScreen(),
                  '/signup': (context) => SignUpScreen(),
                  '/forgetpassword': (context) => const ForgetPasswordScreen(),
                  '/onboarding1': (context) => const Onboarding1(),
                  '/onboarding2': (context) => const Onboarding2(),
                  '/onboarding3': (context) => const Onboarding3(),
                  '/contactus': (context) => const ContactUsScreen(),
                  '/notifications': (context) => const NotificationScreen(),
                  '/settings': (context) => const SettingsScreen(),
                  '/childProfileScreen': (context) =>
                  const ChildProfileScreen(),
                  '/parentProfile': (context) => const ParentProfileScreen(),
                  '/reportAbsent': (context) =>
                  const ReportAbsentScreen(),
                  '/faceIdScreen': (context) => const FaceIdScreen(),
                },
                onGenerateRoute: (settings) {
                  if (settings.name == '/otpVerification') {
                    final args = settings.arguments as Map<String, dynamic>;
                    return MaterialPageRoute(
                      builder: (context) => OTPVerificationScreen(
                        isEmailSelected: args['isEmailSelected'] ?? true,
                      ),
                    );
                  }
                  return null;
                },
              );
            },
          );
        },
      ),
    );
  }
}
