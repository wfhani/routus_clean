import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../components/custom_button.dart';
import '../../../../components/custom_rich_text_button.dart';
import '../../../../components/custom_text_field.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../parent_home/presentation/screens/home_screen.dart';
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
    return GradientScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(23.0),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                );
              } else if (state is AuthFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'Welcome Back',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  const Text('Hey! Good to see you again'),
                  const SizedBox(height: 32),

                  CustomTextField(
                    hintText: 'Email Address',
                    controller: emailController,
                    obscureText: false,
                  ),
                  CustomTextField(
                    hintText: 'Password',
                    obscureText: true,
                    controller: passwordController,
                  ),

                  const SizedBox(height: 40),

                  CustomButton(
                    text: state is AuthLoading ? 'Signing In...' : 'Sign In',
                    onPressed: state is AuthLoading ? () {} : () => _login(context),
                  ),

                  const SizedBox(height: 28),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ForgetPasswordScreen()),
                      );
                    },
                    child: const Text(
                      'Forgot your password?',
                      style: TextStyle(color: Color(0xffFDC70A), fontSize: 16),
                    ),
                  ),

                  const SizedBox(height: 41),

                  const CustomDividerWithText(text: 'or Sign in with'),

                  const SizedBox(height: 32),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Handle Google sign-in
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/Button with centered icon.svg', // Your original Google icon
                          width: 45.w,
                          height: 45.h,
                        ),
                      ),
                      const SizedBox(width: 9),
                      GestureDetector(
                        onTap: () {
                          // Handle Facebook sign-in
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
                              color: Color(0xFF1877F2),
                              size: 25.w,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  CustomRichTextButton(
                    regularText: "Don't have an account? ",
                    buttonText: 'Sign up',
                    navigateToScreen: SignUpScreen(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    context.read<AuthCubit>().login(
      emailController.text.trim(),
      passwordController.text,
    );
  }
}
