import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_theme.dart'; // Import your theme

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("FAQs"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: ListView(
            children: [
              SizedBox(height: 16.h),
              _buildSectionTitle(context, "General Questions"),
              _buildFAQItem(context, "What is Routus?",
                  "Routus is a smart school transportation app that provides real-time tracking, automated attendance, and seamless communication between parents, schools, and drivers."),
              _buildFAQItem(context, "Can I use Routus for multiple children?",
                  "Yes, you can add multiple children under one account in the 'My Children' section."),

              _buildSectionTitle(context, "Tracking & Notifications"),
              _buildFAQItem(context, "How do I track my child’s bus in real time?",
                  "Open the app and go to the 'Track Bus' section to view the live location of your child’s bus."),
              _buildFAQItem(context, "What notifications will I receive?",
                  "Routus provides real-time tracking updates, automated attendance alerts, and important notifications from schools."),
              _buildFAQItem(context, "Can I customize notification settings?",
                  "Yes, go to 'Settings' > 'Notifications' to personalize what you want to be notified about."),

              _buildSectionTitle(context, "Safety & Security"),
              _buildFAQItem(context, "How is my child’s data secured?",
                  "All data is encrypted and securely stored, ensuring compliance with privacy regulations."),
              _buildFAQItem(context, "What happens in case of an emergency?",
                  "In case of an emergency, you will receive an instant alert with details and instructions."),

              _buildSectionTitle(context, "Technical Support"),
              _buildFAQItem(context, "I forgot my password. What should I do?",
                  "Tap 'Forgot Password' on the login screen and follow the instructions to reset it."),
              _buildFAQItem(context, "The app isn’t working properly. How can I fix it?",
                  "Ensure you're using the latest version of the app. If the issue persists, contact our support team."),
              _buildFAQItem(context, "How can I contact support?",
                  "Go to 'Settings' > 'Help & Support' to find our contact details or submit a query."),

              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  // FAQ Item with ExpansionTile
  Widget _buildFAQItem(BuildContext context, String question, String answer) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Card(
        color: Colors.transparent,
        elevation: 0, // ✅ No shadow effect
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent), // ✅ Removes extra dividers
            child: ExpansionTile(
              maintainState: true,
              collapsedIconColor: Colors.black54,
              iconColor: Colors.black87,
              tilePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              childrenPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              title: Text(
                "Q: $question",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Comfortaa',
                  color: const Color(0xFF052A43),
                ),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  child: Divider(color: Colors.amber, thickness: 1.5, indent: 16.w, endIndent: 16.w),
                ),
                Text(
                  "Ans: $answer",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'Comfortaa',
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Section Title
  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'Comfortaa',
          color: Colors.white,
        ),
      ),
    );
  }
}
