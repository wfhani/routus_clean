import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../components/custom_button.dart';
import '../../../../../components/custom_text_field.dart';
import '../../../../../core/theme/app_theme.dart';

class ChangePasswordScreen extends StatelessWidget {
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController = TextEditingController();

  ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return GradientScaffold(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(local.changePassword),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(23.0.sp),
              child: Column(
                children: [
                  SizedBox(height: 32.h),
                  CustomTextField(
                    hintText: local.currentPassword,
                    obscureText: true,
                    controller: currentPasswordController,
                  ),
                  SizedBox(height: 12.h),
                  CustomTextField(
                    hintText: local.newPassword,
                    obscureText: true,
                    controller: newPasswordController,
                  ),
                  SizedBox(height: 12.h),
                  CustomTextField(
                    hintText: local.confirmNewPassword,
                    obscureText: true,
                    controller: confirmNewPasswordController,
                  ),
                  SizedBox(height: 40.h),
                  CustomButton(
                    text: local.save,
                    onPressed: () {
                      final currentPassword = currentPasswordController.text.trim();
                      final newPassword = newPasswordController.text.trim();
                      final confirmNewPassword = confirmNewPasswordController.text.trim();

                      if (currentPassword.isEmpty ||
                          newPassword.isEmpty ||
                          confirmNewPassword.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(local.pleaseFillFields)),
                        );
                        return;
                      }

                      if (newPassword != confirmNewPassword) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(local.passwordsMismatch)),
                        );
                        return;
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(local.passwordChangeSuccess)),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
