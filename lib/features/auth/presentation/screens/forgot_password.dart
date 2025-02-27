import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../components/custom_button.dart';
import '../../../../components/custom_text_field.dart';
import '../../../../components/otp_toggle.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/phone_input_field.dart';
import 'OTP_verification.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController(text: '+20');
  bool isEmailSelected = true;

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(23.0.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 16.h),
                      Text(
                        'Forget Password',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      SizedBox(height: 25.0.h),
                      Text(
                        'Which contact details should be\n used to reset your password?',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 40.0.h),
                      CustomToggle(
                        isEmailSelected: isEmailSelected,
                        onToggle: () {
                          setState(() {
                            isEmailSelected = !isEmailSelected;
                          });
                        },
                      ),
                      SizedBox(height: 12.h),
                      // Use the same spacing between the email and phone input fields
                      SizedBox(
                        width: double.infinity,
                        child: isEmailSelected
                            ? CustomTextField(
                          hintText: 'Enter your email',
                          obscureText: false,
                          controller: emailController,
                        )
                            : PhoneInputField(
                          countryCodeController: countryCodeController,
                          phoneController: phoneController,
                          hintText: 'Enter phone number',
                        ),
                      ),
                      SizedBox(height: 12.h),  // Same spacing between email and phone input fields
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 23.0.sp).copyWith(
                        bottom: MediaQuery.of(context).viewInsets.bottom + 20.h),
                    child: CustomButton(
                      text: 'Send OTP',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OTPVerificationScreen(
                              isEmailSelected: isEmailSelected,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
