import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_theme.dart';
import 'widgets/terms_items.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Terms and Conditions'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 32.h),
                Image.asset(
                  'assets/images/settings/terms (1).png',
                  height: 196.h,
                  width: 228.w,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 24.h),
                Text(
                  'By using the Routus app, you agree to comply with the following terms:',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Comfortaa',
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 24.h),
                TermsItem(
                  title: '1. Account Responsibility',
                  description: 'You must create and maintain an accurate account. Keep your login details secure.',
                ),
                TermsItem(
                  title: '2. App Usage',
                  description: "Use Routus to track buses, receive notifications, and communicate with relevant parties. Do not misuse the app or violate others' rights.",
                ),
                TermsItem(
                  title: '3. Privacy',
                  description: 'We protect your personal data as described in our Privacy Policy. By using the app, you consent to this data collection.',
                ),
                TermsItem(
                  title: '4. Notifications',
                  description: 'Ensure notifications are enabled to receive updates on bus status and other important information.',
                ),
                TermsItem(
                  title: '5. Third-Party Links',
                  description: 'Routus may link to external sites. We are not responsible for their content or practices.',
                ),
                TermsItem(
                  title: '6. Modifications',
                  description: 'We may update these Terms at any time. Continued use of the app means you accept the new terms.',
                ),
                TermsItem(
                  title: '7. Limitation of Liability',
                  description: 'Routus is not liable for any damages or issues caused by using the app.',
                ),
                TermsItem(
                  title: '8. Account Termination',
                  description: 'We may suspend or terminate your account if these terms are violated.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
