import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_theme.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('About Us'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
           // Removed default background
          elevation: 0, // Removed shadow
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF023047), Color(0xFF065A99)],
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h), // Adjusted spacing from AppBar

                // Illustration
                Center(
                  child: SvgPicture.asset(
                    'assets/images/settings/about_us_img.svg',
                    width: 250.w, // Adjusted width for better alignment
                  ),
                ),
                SizedBox(height: 16.h), // Reduced space after image

                // Introduction
                _buildSectionTitle("Welcome to ROUTUS 🚍"),
                _buildParagraph(
                    "Your trusted partner in modernizing school transportation. "
                        "We create a safe, efficient, and user-friendly transportation experience for schools, parents, and students alike."),
                SizedBox(height: 18.h), // Reduced space between sections

                // Key Features
                _buildSectionTitle("Key Features"),
                _buildFeatureItem(Icons.location_on, "Real-Time Tracking", "Monitor your child’s journey every step of the way."),
                _buildFeatureItem(Icons.how_to_reg, "Automated Attendance", "Seamlessly track attendance for better accountability."),
                _buildFeatureItem(Icons.chat, "Seamless Communication", "Stay connected with all stakeholders, anytime, anywhere."),
                _buildFeatureItem(Icons.warning, "Safety Alerts", "Get instant notifications about delays or route changes."),
                SizedBox(height: 18.h),

                // Why Choose ROUTUS
                _buildSectionTitle("Why Choose ROUTUS?"),
                _buildFeatureItem(Icons.security, "Peace of Mind for Parents", "Know your child is safe with our innovative technology."),
                _buildFeatureItem(Icons.school, "Operational Efficiency for Schools", "Streamline processes and improve productivity."),
                _buildFeatureItem(Icons.directions_bus, "Reliable Commute for Students", "Ensuring timely and secure transportation every day."),
                SizedBox(height: 18.h),

                // Inclusivity Statement
                _buildSectionTitle("Inclusivity & Accessibility"),
                _buildParagraph(
                    "Our bilingual platform promotes inclusivity, making it accessible to diverse communities while being easy to use for everyone."),
                SizedBox(height: 12.h), // Reduced padding after inclusivity section


                _buildParagraph("At ROUTUS, we’re committed to delivering smarter, safer, and more connected solutions for today’s education ecosystem."),
                SizedBox(height: 8.h), // Reduced padding at the end

                Center(
                  child: Text(
                    "Let’s redefine school transportation together!",
                    style: TextStyle(
                        color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.bold, fontFamily: 'Comfortaa'),
                  ),
                ),
                SizedBox(height: 30.h), // Reduced final space for better compactness
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget for Section Title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h), // Reduced space below titles
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'Comfortaa',
        ),
      ),
    );
  }

  // Widget for Paragraph Text
  Widget _buildParagraph(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h), // Reduced padding for better compactness
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white70,
          fontSize: 14.sp,
          height: 1.5,
          fontFamily: 'Comfortaa', // Applied Comfortaa font here
        ),
      ),
    );
  }

  // Widget for Feature Item with Icon
  Widget _buildFeatureItem(IconData icon, String title, String description) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h), // Reduced bottom spacing for feature items
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 20.sp),
          SizedBox(width: 8.w), // Reduced space between icon and title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold, fontFamily: 'Comfortaa'),
                ),
                SizedBox(height: 4.h),
                Text(
                  description,
                  style: TextStyle(color: Colors.white70, fontSize: 14.sp, height: 1.4, fontFamily: 'Comfortaa'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
