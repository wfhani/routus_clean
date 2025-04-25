import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:routus_clean/features/parent_home/presentation/screens/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // ✅ Added

import '../../../../components/custom_button.dart';
import '../../../../components/custom_rich_text_button.dart';
import '../../../../components/custom_text_field.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/register/register_request.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/custom_divider_with_text.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!; // ✅ Access localization

    return GradientScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(23.0),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Registration successful!')),
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => HomeScreen()),
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
                  Text(
                    l10n.signUpTitle,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    l10n.signUpSubtitle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          hintText: l10n.firstName,
                          controller: firstNameController,
                          obscureText: false,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomTextField(
                          hintText: l10n.lastName,
                          controller: lastNameController,
                          obscureText: false,
                        ),
                      ),
                    ],
                  ),

                  CustomTextField(
                    hintText: l10n.email,
                    controller: emailController,
                    obscureText: false,
                  ),

                  CustomTextField(
                    hintText: l10n.phone,
                    controller: phoneController,
                    obscureText: false,
                  ),

                  CustomTextField(
                    hintText: l10n.password,
                    obscureText: true,
                    controller: passwordController,
                  ),
                  CustomTextField(
                    hintText: l10n.confirmPassword,
                    obscureText: true,
                    controller: confirmPasswordController,
                  ),

                  const SizedBox(height: 40),

                  CustomButton(
                    text: state is AuthLoading ? l10n.signingUp : l10n.signUp,
                    onPressed: state is AuthLoading ? () {} : () => _register(context),
                  ),

                  const SizedBox(height: 28),

                  CustomDividerWithText(text: l10n.signUpWith),

                  const SizedBox(height: 32),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Handle Google sign-in
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/Button with centered icon.svg',
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
                    regularText: l10n.alreadyHaveAccount,
                    buttonText: l10n.signIn,
                    navigateToScreen: SignInScreen(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _register(BuildContext context) {
    final request = RegisterRequest(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
    );

    context.read<AuthCubit>().register(request);
  }
}
