import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return GradientScaffold(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Change Password'),
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
                  // Current Password Field
                  CustomTextField(
                    hintText: 'Current Password',
                    obscureText: true,
                    controller: currentPasswordController,
                  ),
                  SizedBox(height: 12.h),
                  // New Password Field
                  CustomTextField(
                    hintText: 'New Password',
                    obscureText: true,
                    controller: newPasswordController,
                  ),
                  SizedBox(height: 12.h),
                  // Confirm New Password Field
                  CustomTextField(
                    hintText: 'Confirm New Password',
                    obscureText: true,
                    controller: confirmNewPasswordController,
                  ),
                  SizedBox(height: 40.h),
                  // Save Button
                  CustomButton(
                    text: 'Save',
                    onPressed: () {
                      // Add your logic here (e.g., validation and password change)
                      final currentPassword = currentPasswordController.text.trim();
                      final newPassword = newPasswordController.text.trim();
                      final confirmNewPassword = confirmNewPasswordController.text.trim();

                      // Simple validation
                      if (currentPassword.isEmpty ||
                          newPassword.isEmpty ||
                          confirmNewPassword.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill in all fields')),
                        );
                        return;
                      }

                      if (newPassword != confirmNewPassword) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('New passwords do not match')),
                        );
                        return;
                      }

                      // If validation passes, show a success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Password changed successfully!')),
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