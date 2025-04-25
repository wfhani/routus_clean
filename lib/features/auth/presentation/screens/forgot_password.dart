import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // ✅ Localization

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
    final l10n = AppLocalizations.of(context)!;

    return GradientScaffold(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(l10n.forgotPasswordTitle), // ✅ Localized title
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(23.0.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          l10n.forgotPasswordPrompt,
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
                        SizedBox(
                          width: double.infinity,
                          child: isEmailSelected
                              ? CustomTextField(
                            hintText: l10n.enterEmail,
                            obscureText: false,
                            controller: emailController,
                          )
                              : PhoneInputField(
                            countryCodeController: countryCodeController,
                            phoneController: phoneController,
                            hintText: l10n.enterPhone,
                          ),
                        ),
                        SizedBox(height: 12.h),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 23.0.sp).copyWith(
                        bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
                      ),
                      child: CustomButton(
                        text: l10n.sendOtp,
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
      ),
    );
  }
}
