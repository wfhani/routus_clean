import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../components/custom_button.dart';
import '../../../../components/custom_rich_text_button.dart';
import '../../../../components/custom_text_field.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../parent_home/presentation/screens/home.dart';
import '../../data/repositories/auth_repository.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/custom_divider_with_text.dart';
import 'forgot_password.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepository()),
      child: GradientScaffold(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  // Navigate to the next screen after successful login
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                } else if (state is AuthFailure) {
                  // Show error message if login fails
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(23.0.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 16.h),
                      Text(
                        'Welcome Back',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      SizedBox(height: 12.0.h),
                      Text(
                        'Hey! Good to see you again',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 32.0.h),
                      CustomTextField(
                        hintText: 'Email Address',
                        obscureText: false,
                        controller: emailController,
                      ),
                      CustomTextField(
                        hintText: 'Password',
                        obscureText: true,
                        controller: passwordController,
                      ),
                      SizedBox(height: 40.0.h),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return CustomButton(
                            text: state is AuthLoading ? 'Signing In...' : 'Sign In',
                            onPressed: () {
                              if (state is! AuthLoading) {
                                final email = emailController.text.trim();
                                final password = passwordController.text.trim();

                                if (email.isEmpty || password.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Please fill in all fields')),
                                  );
                                  return;
                                }

                                if (!email.contains('@')) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Please enter a valid email address')),
                                  );
                                  return;
                                }

                                context.read<AuthCubit>().login(email, password);
                              }
                            },
                          );
                        },
                      ),
                      SizedBox(height: 28.0.h),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgetPasswordScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Forgot your password?',
                          style: TextStyle(
                            fontFamily: 'Comfortaa',
                            color: const Color(0xffFDC70A),
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 41.0.h),
                      const CustomDividerWithText(
                        text: 'or Sign in with',
                      ),
                      SizedBox(height: 32.0.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              // Handle Google sign in
                            },
                            icon: SvgPicture.asset(
                              'assets/icons/Button with centered icon.svg',
                              width: 45.w,
                              height: 45.h,
                            ),
                            iconSize: 45.w,
                          ),
                          SizedBox(width: 9.0.w),
                          GestureDetector(
                            onTap: () {
                              // Handle Facebook sign in
                            },
                            child: Container(
                              width: 45.w,
                              height: 45.h,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.facebookF,
                                  color: const Color(0xFF1877F2),
                                  size: 25.w,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32.0.h),
                      CustomRichTextButton(
                        regularText: "Don't have an account? ",
                        buttonText: 'Sign up',
                        navigateToScreen: SignUpScreen(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}