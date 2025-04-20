import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF052A43),
            Color(0xFF0D6AA9),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("Privacy Policy"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SvgPicture.asset(
                  'assets/images/settings/Privacy policy-bro 1.svg',
                  width: 326.w,
                  height: 242.h,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 24.h),
              _policyCard("Data Collection", "We collect personal info (name, email, phone) and child data (e.g., Face ID) for safety and app functionality; location data is used for bus tracking and notifications."),
              SizedBox(height: 24.h),
              _policyCard("Data Usage", "Data ensures app features like tracking and notifications work efficiently. No data is sold or shared with advertisers."),
              SizedBox(height: 24.h),
              _policyCard("Data Security", "Your data is encrypted and secured with modern safety measures."),
              SizedBox(height: 24.h),
              _policyCard("Third-Party Services", "Trusted third parties handle GPS tracking and analytics."),
              SizedBox(height: 24.h),
              _policyCard("Parental Consent", "Parents’ explicit consent is required for all data collection."),
              SizedBox(height: 24.h),
              _policyCard("User Rights", "Users can access, update, or delete their personal data at any time."),
            ],
          ),
        ),
      ),
    );
  }

  Widget _policyCard(String title, String text) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF0D6AA9),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            text,
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
