import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../components/custom_button.dart';
import '../../../../components/custom_rich_text_button.dart';
import '../../../../components/otp_input_field.dart';
import '../../../../core/theme/app_theme.dart';
import 'set_new_password.dart';

class OTPVerificationScreen extends StatelessWidget {
  final bool isEmailSelected;

  const OTPVerificationScreen({super.key, required this.isEmailSelected});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return GradientScaffold(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            isEmailSelected ? l10n.emailVerification : l10n.phoneVerification,
            style: Theme.of(context).appBarTheme.titleTextStyle,
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
                      ? l10n.otpSentToEmail
                      : l10n.otpSentToPhone,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 16.h),
                const OTPInputField(),
                SizedBox(height: 16.h),
                CustomRichTextButton(
                  regularText: l10n.didNotReceiveCode,
                  buttonText: l10n.resend,
                  navigateToScreen: OTPVerificationScreen(isEmailSelected: isEmailSelected),
                ),
                const Expanded(child: SizedBox()),
                CustomButton(
                  text: l10n.verify,
                  onPressed: () {
                    Navigator.pushReplacement(
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
