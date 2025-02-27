import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../components/custom_button.dart';
import '../../../../components/custom_rich_text_button.dart';
import '../../../../components/custom_text_field.dart';
import '../widgets/custom_divider_with_text.dart';
import '../../../../core/theme/app_theme.dart';
import '../cubit/auth_cubit.dart';
import 'sign_in_screen.dart';
import '../../data/repositories/auth_repository.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepository()),
      child: GradientScaffold(
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(23.0.sp),
                child: BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccess) {
                      // Navigate to the next screen or show success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Registration successful!')),
                      );
                      // Example: Navigate to the home screen
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
                    } else if (state is AuthFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.error)),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 16.h),

                        // Title
                        Text(
                          'Create New Account',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),

                        SizedBox(height: 12.0.h),

                        // Subtitle
                        Center(
                          child: Text(
                            'Provide your information to set up your account.',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),

                        SizedBox(height: 32.0.h),

                        // First Name & Last Name
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                hintText: 'First Name',
                                obscureText: false,
                                controller: firstNameController,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: CustomTextField(
                                hintText: 'Last Name',
                                obscureText: false,
                                controller: lastNameController,
                              ),
                            ),
                          ],
                        ),

                        // Email Field
                        CustomTextField(
                          hintText: 'Email Address',
                          obscureText: false,
                          controller: emailController,
                        ),

                        // Phone Number Field
                        CustomTextField(
                          hintText: 'Phone Number',
                          obscureText: false,
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                        ),

                        // Password Fields
                        CustomTextField(
                          hintText: 'Password',
                          obscureText: true,
                          controller: passwordController,
                        ),
                        CustomTextField(
                          hintText: 'Confirm Password',
                          obscureText: true,
                          controller: confirmPasswordController,
                        ),

                        SizedBox(height: 40.0.h),

                        // Sign Up Button
                        CustomButton(
                          text: 'Sign Up',
                          onPressed: () {
                            if (passwordController.text != confirmPasswordController.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Passwords do not match')),
                              );
                              return;
                            }
                            context.read<AuthCubit>().register(
                              firstNameController.text,
                              lastNameController.text,
                              emailController.text,
                              phoneController.text,
                              passwordController.text,
                              confirmPasswordController.text,
                            );
                          },
                        ),

                        SizedBox(height: 28.0.h),

                        // Divider
                        CustomDividerWithText(
                          text: 'or Sign up with',
                        ),

                        SizedBox(height: 32.0.h),

                        // Social Sign Up Options
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
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.facebookF,
                                    color: Color(0xFF1877F2),
                                    size: 25.w,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 32.0.h),

                        // Sign In Option
                        CustomRichTextButton(
                          regularText: "Already have an account? ",
                          buttonText: 'Sign In',
                          navigateToScreen: SignInScreen(),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}