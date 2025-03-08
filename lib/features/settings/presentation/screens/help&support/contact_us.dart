import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/contact_card.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Contact Us'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF003366), Color(0xFF0066CC)], // Custom gradient
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 120.h), // Space below AppBar
              Image.asset(
                'assets/images/settings/contact_img.png', // Ensure PNG or proper format
                height: 242.h,
                width: 326.w,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 32.h), // Space below image
              Text(
                'How can we help you?',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h), // Space below first text
              Text(
                'It looks like you’re having a problem. Reach out to us, and we\'ll be happy to help!',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContactCard(
                    icon: Icons.email,
                    text: "Email Us",
                    onTap: () {
                      // Handle email action
                    },
                  ),
                  SizedBox(width: 42.w),
                  ContactCard(
                    icon: Icons.phone,
                    text: "Call Us",
                    onTap: () {
                      // Handle call action
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
