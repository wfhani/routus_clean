import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_theme.dart';
import 'widgets/policy_cards.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Privacy Policy'),
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

                // Privacy Policy Image
                Center(
                  child: SizedBox(
                    width: 326.w,
                    height: 242.h,
                    child: Image.asset('assets/images/settings/Privacy policy-bro 1.svg', fit: BoxFit.contain),
                  ),
                ),

                SizedBox(height: 32.h),

                // Privacy Policy Sections
                const PolicyCard(
                  title: "Data Collection",
                  content: "We collect personal info (name, email, phone) and child data (e.g., Face ID) for safety and app functionality; location data is used for bus tracking and notifications.",
                ),

                SizedBox(height: 24.h),
                const PolicyCard(
                  title: "Data Usage",
                  content: "Data ensures app features like tracking and notifications work efficiently. No data is sold or shared with advertisers.",
                ),

                SizedBox(height: 24.h),
                const PolicyCard(
                  title: "Data Security",
                  content: "Your data is encrypted and secured with regular audits.",
                ),

                SizedBox(height: 24.h),
                const PolicyCard(
                  title: "Third-Party Services",
                  content: "Trusted third parties handle GPS tracking and notifications securely.",
                ),

                SizedBox(height: 24.h),
                const PolicyCard(
                  title: "Parental Consent",
                  content: "Parents’ explicit consent is required for collecting and using children's data.",
                ),

                SizedBox(height: 24.h),
                const PolicyCard(
                  title: "User Rights",
                  content: "Users can access, update, or delete their data anytime.",
                ),

                SizedBox(height: 24.h),
                const PolicyCard(
                  title: "Cookies and Analytics",
                  content: "Non-personal data, such as app usage patterns, is collected to improve app functionality. Cookies are used for app optimization, and users can disable them through device settings.",
                ),

                SizedBox(height: 24.h),
                const PolicyCard(
                  title: "Changes to Policy",
                  content: "Changes will be shared via the app—review regularly.",
                ),

                SizedBox(height: 24.h),
                const PolicyCard(
                  title: "Contact Us",
                  content: "For questions or concerns about privacy, contact us at support@routus.com",
                ),

                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
