import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../components/custom_button.dart';
import '../../../../components/custom_rich_text_button.dart';
import '../../../../components/otp_input_field.dart';
import '../../../../core/theme/app_theme.dart';
import 'set_new_password.dart';

class OTPVerificationScreen extends StatelessWidget {
  final bool isEmailSelected;

  OTPVerificationScreen({required this.isEmailSelected});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            isEmailSelected ? 'Email Verification' : 'Phone Verification',
            style: Theme.of(context).appBarTheme.titleTextStyle, // Use the theme for title
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(23.0.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 48.h),
                Text(
                  isEmailSelected
                      ? 'The code is sent to your email'
                      : 'The code is sent to your phone',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium, // Apply theme style for body text
                ),
                SizedBox(height: 16.h),
                OTPInputField(), // Use the custom OTP input component
                SizedBox(height: 16.h),
                CustomRichTextButton(
                  regularText: "Didn’t receive code? ",
                  buttonText: 'Resend again',
                  navigateToScreen: OTPVerificationScreen(isEmailSelected: isEmailSelected),
                ), // Rich text button moved above the verify button
                Expanded(child: SizedBox()), // This expands and pushes the button to the bottom
                CustomButton(
                  text: 'Verify',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SetNewPasswordScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
