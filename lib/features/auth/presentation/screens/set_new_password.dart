import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../components/custom_button.dart';
import '../../../../components/custom_text_field.dart';
import '../../../../core/theme/app_theme.dart';



class SetNewPasswordScreen extends StatelessWidget {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(23.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16.h),
              Text(
                'Set New Password',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 25.h),
              Text(
                'Create a secure password to protect your account',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 40.h),
              CustomTextField(
                hintText: 'New Password',
                obscureText: true,
                controller: newPasswordController,
              ),
              CustomTextField(
                hintText: 'Confirm New Password',
                obscureText: true,
                controller: confirmPasswordController,
              ),
              Expanded(child: SizedBox()), // This pushes the button to the bottom
              SizedBox(height: 16.h), // Adds the space between the button and the bottom
              CustomButton(
                text: 'Save',
                onPressed: () {
                  // Handle save logic here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
