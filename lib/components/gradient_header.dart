import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onSettingsTap;
  final VoidCallback? onNotificationsTap;
  final double height;

  const GradientHeader({
    super.key,
    required this.title,
    required this.subtitle,
     this.onSettingsTap,
     this.onNotificationsTap,
    this.height = 250,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF052A43), Color(0xFF0D6AA9)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23).copyWith(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.settings, color: Colors.white, size: 28),
                  onPressed: onSettingsTap,
                ),
                IconButton(
                  icon: const Icon(Icons.notifications, color: Colors.white, size: 28),
                  onPressed: onNotificationsTap,
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Welcome Text
            Text(
              title,
              style: GoogleFonts.nunito(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Text(
              subtitle,
              style: GoogleFonts.nunito(
                fontSize: 18,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
