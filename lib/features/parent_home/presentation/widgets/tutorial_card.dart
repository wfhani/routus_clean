import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';
import 'package:routus_clean/features/parent_home/presentation/screens/video_player_screen.dart';

class TutorialCard extends StatelessWidget {
  const TutorialCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Full width
      height: 170.h, // Adjust based on Figma reference
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23.r), // Rounded corners
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF052A43), // Dark Blue (Top)
            Color(0xFF0D6AA9), // Light Blue (Bottom)
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      child: Row(
        children: [
          // **SVG Illustration on the Left**
          SvgPicture.asset(
            'assets/images/tutorial_illustration.svg', // ✅ Correct asset path
            width: 130.w, // Figma size
            height: 130.h,
          ),

          SizedBox(width: 10.w), // Increased spacing for better alignment

          // **Text and Video Icon on the Right**
          Expanded(
            child: Stack(
              alignment: Alignment.bottomRight, // ✅ Play button at bottom-right
              children: [
                // **Text Content**
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // **Bold Comfortaa Font for the Title**
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.h), // Fine-tuned spacing
                      child: Text(
                        "Navigate with Routus:",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Comfortaa', // ✅ Apply Comfortaa font
                          color: Colors.white,
                        ),
                      ),
                    ),

                    // **Regular Comfortaa Font for the Subtitle**
                    Text(
                      "A Guide to Seamless \nBus Tracking!\n\n3 minutes",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Comfortaa', // ✅ Apply Comfortaa font
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                // **Clickable Play Button**
                Positioned(
                  bottom: 5.h, // ✅ Adjusted offset
                  right: 5.w, // ✅ Adjusted offset
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VideoPlayerScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white, // ✅ Solid white background
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.black.withOpacity(0.5), // ✅ Semi-transparent black arrow
                        size: 24.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}









